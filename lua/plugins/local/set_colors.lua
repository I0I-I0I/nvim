local M = {
	dir = vim.g.local_plugins_path .. "set_colors",
}

M.keys = function()
	local set_colors = require("set_colors")

	return {
		{
			"tt",
			function()
				set_colors.change_colorscheme(1)
			end,
			{ silent = true, noremap = true },
			desc = "Colorchemes",
		},
		{
			"tat",
			function()
				set_colors.change_colorscheme(0.73)
			end,
			{ silent = true, noremap = true },
			desc = "Colorchemes (transparent)",
		},

		{
			"tT",
			function()
				set_colors.toggle_theme_style()
			end,
			{ silent = true, noremap = true },
			desc = "Colorchemes (transparent)",
		},
	}
end

return M
