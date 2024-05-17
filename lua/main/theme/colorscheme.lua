local Color = {
	{ "rebelot/kanagawa.nvim", lazy = false, priority = 1000 },
	{ "sainnhe/everforest", lazy = false, priority = 1000 },
	{ "folke/tokyonight.nvim", lazy = false, priority = 1000 },
	{ "shaunsingh/nord.nvim", lazy = false, priority = 1000 },
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
}

Theme_utils = "main.theme.utils."

require(Theme_utils .. "disableItalic")
require(Theme_utils .. "setColorscheme")
require(Theme_utils .. "setColor")

return Color
