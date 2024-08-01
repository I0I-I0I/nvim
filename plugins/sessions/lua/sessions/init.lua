local M = {}

local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local sorters = require("telescope.sorters")
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local dropdown = require("telescope.themes").get_dropdown()

M.marker = "FOR_TELESCOPE"

function M.delete(prompt_bufnr)
	actions.close(prompt_bufnr)
	local selected = action_state.get_selected_entry()

	local file = selected[1]:gsub("/", ":"):sub(1, -1) .. ".vim"

	vim.cmd("!rm -rf ~/sessions/" .. file)
	vim.cmd("!rm -rf ~/sessions/FOR_TELESCOPE" .. file)
	vim.cmd("SessionsList")
end

function M.enter(prompt_bufnr)
	actions.close(prompt_bufnr)
	local selected = action_state.get_selected_entry()

	vim.cmd("cd " .. selected[1])
end

function M.get_dirs()
	M.dirs = {}
	for k, _ in vim.fn.execute("!ls ~/sessions"):gmatch("[A-Za-z_.:|0-9\\-]+.vim") do
		local dir = k:gsub(":", "/"):sub(1, -5)
		if dir:match(M.marker) then
			table.insert(M.dirs, dir:gsub(M.marker, ""):sub(1, -1))
		end
	end
	return M.dirs
end

function M.opts()
	return {
		preview = true,
		prompt_title = "Color Schemes",
		finder = finders.new_table({
			results = M.get_dirs(),
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
	vim.cmd("mksession! ~/sessions/" .. vim.fn.getcwd():gsub("/", ":") .. ".vim")
	if flag then
		vim.cmd("!touch ~/sessions/FOR_TELESCOPE" .. vim.fn.getcwd():gsub("/", ":") .. ".vim")
	end
end

function M.attach_session()
	vim.cmd("source ~/sessions/" .. vim.fn.getcwd():gsub("/", ":") .. ".vim")
end

function M.open_list()
	pickers.new(dropdown, M.opts()):find()
end

return M
