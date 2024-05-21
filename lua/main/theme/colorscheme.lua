Colorschemes = {
	{
		"Alexis12119/nightly.nvim",
		name = "nightly",
		lazy = false,
		priority = 1000,
		theme_names = {
			"nightly",
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
		"rebelot/kanagawa.nvim",
		name = "kanagawa",
		lazy = false,
		priority = 1000,
		theme_names = {
			"kanagawa",
		},
	},
	{
		"lunarvim/horizon.nvim",
		name = "horizon",
		lazy = false,
		priority = 1000,
		theme_names = {
			"horizon",
		},
	},
	{
		"projekt0n/github-nvim-theme",
		name = "github",
		lazy = false,
		priority = 1000,
		theme_names = {
			"github_dark_dimmed",
			"github_light",
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
		"folke/tokyonight.nvim",
		name = "tokyonight",
		lazy = false,
		priority = 1000,
		theme_names = {
			"tokyonight",
		},
	},
	{
		"Everblush/nvim",
		name = "everblush",
		lazy = false,
		priority = 1000,
		theme_names = {
			"everblush",
		},
	},
	{
		"pauchiner/pastelnight.nvim",
		name = "pastelnight",
		lazy = false,
		priority = 1000,
		theme_names = {
			"pastelnight",
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
		"jabuti-theme/jabuti-nvim",
		name = "jabuti",
		lazy = false,
		priority = 1000,
		theme_names = {
			"jabuti",
		},
	},
}

Theme_utils = "main.theme.utils."

require(Theme_utils .. "disableItalic")
require(Theme_utils .. "setColors")
require(Theme_utils .. "setColorscheme")

return Colorschemes
