local M = {
	dir = vim.g.local_plugins_path .. "set_colors",
}

M.keys = {
	{
		"<leader>ft",
		function()
			require("set_colors").change_colorscheme(1)
		end,
		{ silent = true, noremap = true },
		desc = "Colorchemes",
	},
	{
		"<leader>fat",
		function()
			require("set_colors").change_colorscheme(0.73)
		end,
		{ silent = true, noremap = true },
		desc = "Colorchemes (transparent)",
	},

	{
		"<leader>tt",
		function()
			require("set_colors").toggle_theme_style()
		end,
		{ silent = true, noremap = true },
		desc = "Colorchemes (transparent)",
	},
}

return M
