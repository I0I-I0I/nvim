Colorschemes = {
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
		"Alexis12119/nightly.nvim",
		name = "nightly",
		lazy = false,
		priority = 1000,
		theme_names = {
			"nightly",
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
		"pauchiner/pastelnight.nvim",
		name = "pastelnight",
		lazy = false,
		priority = 1000,
		theme_names = {
			"pastelnight",
		},
	},
}

Theme = "default.theme."
Theme_utils = Theme .. "utils."

require(Theme .. "setColors")
require(Theme .. "setColorscheme")

return Colorschemes
