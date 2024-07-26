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
			-- "rosebones",
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
	-- {
	-- 	"catppuccin/nvim",
	-- 	name = "catppuccin",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	theme_names = {
	-- 		"catppuccin-latte",
	-- 		-- "catppuccin-macchiato",
	-- 	},
	-- },
}

Theme = default .. ".theme."
Theme_utils = Theme .. "utils."

require(Theme .. "setColors")
require(Theme .. "setColorscheme")

return Colorschemes
