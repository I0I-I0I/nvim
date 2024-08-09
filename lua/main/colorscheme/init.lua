local colorschemes = {
	{
		"neanias/everforest-nvim",
		version = false,
		lazy = false,
		priority = 1000,
		config = function()
			require("everforest").setup({
				background = "hard",
				italics = true,
				dim_inactive_windows = true,
				diagnostic_text_highlight = true,
			})
		end,
		theme_names = {
			"everforest",
		},
	},
	{
		"sainnhe/sonokai",
		name = "sonokai",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.sonokai_enable_italic = true
			vim.g.sonokai_style = "default"
		end,
		theme_names = {
			"sonokai",
		},
	},
	-- {
	-- 	"EdenEast/nightfox.nvim",
	-- 	name = "nightfox",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	theme_names = {
	-- 		"nightfox",
	-- 		"dayfox",
	-- 		"duskfox",
	-- 		"carbonfox",
	-- 	},
	-- },
	{
		"zenbones-theme/zenbones.nvim",
		name = "zenbones",
		lazy = false,
		priority = 1000,
		dependencies = {
			"rktjmp/lush.nvim",
		},
		theme_names = {
			"zenbones",
			"rosebones",
		},
	},
	{
		"rebelot/kanagawa.nvim",
		name = "kanagawa",
		lazy = false,
		priority = 1000,
		theme_names = {
			"kanagawa",
		},
	},
	{
		"akinsho/horizon.nvim",
		name = "horizon",
		lazy = false,
		priority = 1000,
		theme_names = {
			"horizon",
		},
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = false,
		priority = 1000,
		theme_names = {
			"rose-pine",
		},
		opts = {
			variant = "main", -- auto, main, moon, or dawn
			dark_variant = "main", -- main, moon, or dawn
			dim_inactive_windows = true,
			extend_background_behind_borders = false,
		},
	},
	-- {
	-- 	"catppuccin/nvim",
	-- 	name = "catppuccin",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	theme_names = {
	-- 		"catppuccin-latte",
	-- 		"catppuccin-macchiato",
	-- 	},
	-- },
}

require("set_colors").add_colorschemes(colorschemes)

return colorschemes
