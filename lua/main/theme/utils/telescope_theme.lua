local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local sorters = require("telescope.sorters")
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local dropdown = require("telescope.themes").get_dropdown()

local colors = GetColorschemeNames()

local function next_color(prompt_bufnr)
	actions.move_selection_next(prompt_bufnr)
	local selected = action_state.get_selected_entry()
	vim.cmd("Color " .. selected[1] .. Transparency)
end

local function prev_color(prompt_bufnr)
	actions.move_selection_previous(prompt_bufnr)
	local selected = action_state.get_selected_entry()
	vim.cmd("Color " .. selected[1] .. Transparency)
end

local function enter(prompt_bufnr, ff, aa)
	actions.close(prompt_bufnr)
	local selected = action_state.get_selected_entry()

	local cmd = "Color " .. selected[1] .. Transparency
	local init = vim.fn.expand(Path_to_config .. "theme/theme.lua")
	local job_cmd = "sed -i '$ d' " .. init .. " && echo 'vim.cmd(\"" .. cmd .. "\")' >> " .. init
	vim.fn.jobstart(job_cmd)

	vim.cmd(cmd)
end

local opts = {
	preview = true,
	prompt_title = "Color Schemes",
	finder = finders.new_table(colors),
	sorter = sorters.get_generic_fuzzy_sorter(),

	attach_mappings = function(prompt_bufnr, map)
		map({ "n", "i" }, "<CR>", enter)
		map("i", "<C-n>", next_color)
		map("i", "<C-p>", prev_color)

		map("n", "j", next_color)
		map("n", "k", prev_color)

		return true
	end,
}

local all_colorschemes = pickers.new(dropdown, opts)

vim.api.nvim_create_user_command("Colors", function(input)
	Transparency = " " .. input.fargs[1]
	if not Transparency then
		Transparency = 0.73
	end
	all_colorschemes:find()
end, {
	nargs = "*",
})

vim.keymap.set("n", "<leader>tt", "<cmd>Colors 1<cr>")
vim.keymap.set("n", "<leader>ta", "<cmd>Colors 0.73<cr>")
