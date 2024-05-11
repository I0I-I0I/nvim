local Colorschemes = {
	{ "rebelot/kanagawa.nvim", lazy = false, priority = 1000 },
	{ "sainnhe/everforest", lazy = false, priority = 1000 },
	{ "folke/tokyonight.nvim", lazy = false, priority = 1000 },
	{ "shaunsingh/nord.nvim", lazy = false, priority = 1000 },
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
}

Themes = "main.themes."
local utils = Themes .. "utils."

require(utils .. "disableItalic")
require(utils .. "stringToArray")
require(utils .. "setColorscheme")
require(utils .. "setColor")

return Colorschemes
