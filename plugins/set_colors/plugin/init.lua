local set_colors = require("set_colors")

Bind({
	["n"] = {
		["<plugleader>ft"] = {
			function()
				set_colors.change_colorscheme(1)
			end,
			{ silent = true, noremap = true },
			desc = "Colorchemes",
		},
		["<plugleader>fat"] = {
			function()
				set_colors.change_colorscheme(0.73)
			end,
			{ silent = true, noremap = true },
			desc = "Colorchemes (transparent)",
		},

		["<leader>tt"] = {
			function()
				set_colors.toggle_theme_style()
			end,
			{ silent = true, noremap = true },
			desc = "Colorchemes (transparent)",
		},
	},
})
