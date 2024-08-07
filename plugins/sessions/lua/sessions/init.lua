local M = {}

local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local sorters = require("telescope.sorters")
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local dropdown = require("telescope.themes").get_dropdown()

M.marker = "FOR_TELESCOPE"
M.Path = "/mnt/d/sessions/"
M.dirs = {}

function M.delete(prompt_bufnr)
	actions.close(prompt_bufnr)
	local selected = action_state.get_selected_entry()[1]
	local selected_copy = selected:sub(1, -1)
	selected = selected:gsub(" ", "_")
	local dir = M.dirs[selected]
	local file = dir:gsub("/", ":"):sub(1, -1) .. ".vim"

	vim.cmd("silent !rm -rf " .. M.Path .. file)
	vim.cmd("silent !rm -rf " .. M.Path .. "FOR_TELESCOPE\\(" .. selected:gsub('"', '\\"'):sub(1, -1) .. "\\)" .. file)
	print("Session deleted: " .. selected_copy)
	vim.cmd("SessionsList")
end

function M.enter(prompt_bufnr)
	actions.close(prompt_bufnr)
	local selected = action_state.get_selected_entry()
	local dir = selected[1]:gsub(" ", "_")

	vim.cmd("cd " .. M.dirs[dir])
end

function M.get_dirs()
	M.dirs = {}
	for k, _ in vim.fn.execute("!ls " .. M.Path):gmatch("[A-Za-z_.:|0-9()\"'\\-]+.vim") do
		local dir = k:gsub(":", "/"):sub(1, -5)
		if dir:match(M.marker) then
			local session_name = dir:match("[(](.+)[)]")
			dir = dir:match(M.marker .. "[(].+[)](.*)")

			M.dirs[session_name] = dir
		end
	end
	return M.dirs
end

function M.opts()
	local sessions = {}
	for session_name, dir in pairs(M.get_dirs()) do
		table.insert(sessions, session_name:gsub("_", " "):sub(1, -1))
	end
	table.sort(sessions)

	return {
		preview = true,
		prompt_title = "🗃️ All sessions",
		finder = finders.new_table({
			results = sessions,
		}),
		sorter = sorters.get_generic_fuzzy_sorter(),

		attach_mappings = function(prompt_bufnr, map)
			map({ "n", "i" }, "<CR>", M.enter)
			map("n", "dd", M.delete)
			map("i", "<C-d>", M.delete)
			return true
		end,
	}
end

function M.create_session(flag)
	vim.cmd("mksession! " .. M.Path .. vim.fn.getcwd():gsub("/", ":") .. ".vim")
	if flag then
		local prompt = vim.fn.input("Enter Session Name: ")
		local prompt_copy = prompt:sub(1, -1)
		if prompt == "" then
			return
		end
		prompt = prompt:gsub(" ", "_")
		prompt = prompt:gsub('"', '\\"')
		vim.cmd(
			"silent !touch "
				.. M.Path
				.. "FOR_TELESCOPE\\("
				.. prompt
				.. "\\)"
				.. vim.fn.getcwd():gsub("/", ":")
				.. ".vim"
		)
		print("Session created: " .. prompt_copy)
	end
end

function M.attach_session()
	vim.cmd("silent source " .. M.Path .. vim.fn.getcwd():gsub("/", ":") .. ".vim")
end

function M.open_list()
	pickers.new(dropdown, M.opts()):find()
end

return M
