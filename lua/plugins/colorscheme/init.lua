local colorschemes = {
	{
		"rose-pine/neovim",
		name = "ColorScheme_rose-pine",
		lazy = false,
		priority = 1000,
		theme_names = {
			"rose-pine",
		},
		config = function()
			require("rose-pine").setup({
				variant = "main", -- auto, main, moon, or dawn
				dark_variant = "main", -- main, moon, or dawn
				dim_inactive_windows = false,
				extend_background_behind_borders = true,
				disable_background = false,
			})
		end,
	},

	{
		"sainnhe/everforest",
		name = "ColorScheme_everforest",
		version = false,
		lazy = false,
		priority = 1000,
		theme_names = {
			"everforest",
		},
		init = function()
			vim.g.everforest_background = "hard"
			vim.g.everforest_transparent_background = 0
			vim.g.everforest_spell_foreground = "colored" -- none
			vim.g.everforest_ui_contrast = "high" -- low
			vim.g.everforest_show_eob = 0
			vim.g.everforest_float_style = "dim" -- bright
			vim.g.everforest_diagnostic_text_highlight = 1
			vim.g.everforest_diagnostic_line_highlight = 1
			vim.g.everforest_inlay_hints_background = "dimmed" -- none
			vim.g.everforest_colors_override = {
				bg0 = { '#202020', '234' },
				bg2 = { '#282828', '235' }
			}
		end,
	},

	{
		"zenbones-theme/zenbones.nvim",
		name = "ColorScheme_zenbones",
		theme_names = {
			"zenbones",
		},
		lazy = false,
		priority = 1000,
		init  = function()
			vim.g.zenbones_compat = 1
		end,
	},

	{
		'Verf/deepwhite.nvim',
		name = "ColorScheme_deepwhite",
		lazy = false,
		priority = 1000,
		theme_names = {
			'deepwhite',
		},
	},
}

local ok, set_colors = pcall(require, "set_colors")
if ok then
	set_colors.add_colorschemes(colorschemes)
end

autocmd("BufEnter", {
	pattern = "*",
	callback = function()
		vim.cmd.hi("NormalNC guibg=Normal")
	end
})

return colorschemes
