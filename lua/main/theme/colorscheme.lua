Colorschemes = {
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
		"sainnhe/everforest",
		name = "everforest",
		lazy = false,
		priority = 1000,
		theme_names = {
			"everforest",
		},
	},
	{
		"folke/tokyonight.nvim",
		name = "tokyonight",
		lazy = false,
		priority = 1000,
		theme_names = {
			"tokyonight",
		},
	},
	{
		"shaunsingh/nord.nvim",
		name = "nord",
		lazy = false,
		priority = 1000,
		theme_names = {
			"nord",
		},
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,
		theme_names = {
			"catppuccin-latte",
			"catppuccin-macchiato",
		},
	},
	{
		"EdenEast/nightfox.nvim",
		name = "nightfox",
		lazy = false,
		priority = 1000,
		theme_names = {
			"dawnfox",
			"duskfox",
			"nordfox",
		},
	},
	{
		"navarasu/onedark.nvim",
		name = "onedark",
		lazy = false,
		priority = 1000,
		theme_names = {
			"onedark",
		},
	},
	{
		"oxfist/night-owl.nvim",
		name = "night-owl",
		lazy = false,
		priority = 1000,
		theme_names = {
			"night-owl",
		},
	},
	{
		"Alexis12119/nightly.nvim",
		name = "nightly",
		lazy = false,
		priority = 1000,
		theme_names = {
			"nightly",
		},
	},
}

Theme_utils = "main.theme.utils."

require(Theme_utils .. "disableItalic")
require(Theme_utils .. "setColors")
require(Theme_utils .. "setColorscheme")

return Colorschemes
