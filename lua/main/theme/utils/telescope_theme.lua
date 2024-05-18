local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
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

local function enter(prompt_bufnr)
	actions.close(prompt_bufnr)
	local selected = action_state.get_selected_entry()

	local cmd = "Color " .. selected[1] .. Transparency
	local init = vim.fn.expand("~/.config/nvim/lua/main/init.lua")
	local job_cmd = "sed -i '$ d' " .. init .. " && echo 'vim.cmd(\"" .. cmd .. "\")' >> " .. init
	vim.fn.jobstart(job_cmd)

	vim.cmd(cmd)
end

local opts = {
	preview = true,
	prompt_title = "Color Schemes",
	finder = finders.new_table(colors),
	sorter = conf.generic_sorter(),

	attach_mappings = function(prompt_bufnr, map)
		map("i", "<CR>", enter)
		map("i", "<C-n>", next_color)
		map("i", "<C-p>", prev_color)
		return true
	end,
}

local all_colorschemes = pickers.new(dropdown, opts)

vim.api.nvim_create_user_command("Colors", function()
	Transparency = " 1"
	all_colorschemes:find()
end, {})

vim.api.nvim_create_user_command("ColorsAlpha", function()
	Transparency = " 0.8"
	all_colorschemes:find()
end, {})

vim.keymap.set("n", "<leader>tt", "<cmd>Colors<cr>")
vim.keymap.set("n", "<leader>ta", "<cmd>ColorsAlpha<cr>")
