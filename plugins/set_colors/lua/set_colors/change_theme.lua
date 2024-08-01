local M = {}

local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local sorters = require("telescope.sorters")
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local dropdown = require("telescope.themes").get_dropdown()

local get_colorscheme_names = require("set_colors.utils.get_colorscheme_names").get_colorscheme_names

M.transparency = 1

function M.next_color(prompt_bufnr)
	actions.move_selection_next(prompt_bufnr)
	local selected = action_state.get_selected_entry()
	vim.cmd("SetColor " .. selected[1] .. M.transparency)
end

function M.prev_color(prompt_bufnr)
	actions.move_selection_previous(prompt_bufnr)
	local selected = action_state.get_selected_entry()
	vim.cmd("SetColor " .. selected[1] .. M.transparency)
end

function M.enter(prompt_bufnr)
	actions.close(prompt_bufnr)
	local selected = action_state.get_selected_entry()

	local cmd = "SetColor " .. selected[1] .. M.transparency
	local init = vim.fn.expand(vim.fn.stdpath("config") .. "/lua/default/colorscheme/theme.lua")
	local job_cmd = "sed -i '$ d' " .. init .. " && echo 'vim.cmd(\"" .. cmd .. "\")' >> " .. init
	vim.fn.jobstart(job_cmd)

	vim.cmd(cmd)
end

function M.update_opts(arr)
	return {
		preview = true,
		prompt_title = "Color Schemes",
		finder = finders.new_table({
			results = arr,
		}),
		sorter = sorters.get_generic_fuzzy_sorter(),

		attach_mappings = function(prompt_bufnr, map)
			map({ "n", "i" }, "<CR>", M.enter)
			map("i", "<C-n>", M.next_color)
			map("i", "<C-p>", M.prev_color)

			map("n", "j", M.next_color)
			map("n", "k", M.prev_color)

			return true
		end,
	}
end

function M.run(transparency)
	M.colors = get_colorscheme_names()
	M.transparency = " " .. transparency
	if not M.transparency then
		M.transparency = 0.7
	end
	pickers.new(dropdown, M.update_opts(M.colors)):find()
end

vim.api.nvim_create_user_command("Colors", function(input)
	M.run(input.fargs[1])
end, {
	nargs = "*",
})

return M
