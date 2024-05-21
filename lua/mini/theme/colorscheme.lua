Colorschemes = {
	Plug("Alexis12119/nightly.nvim"),
	Plug("sainnhe/everforest"),
	Plug("catppuccin/nvim"),
	Plug("EdenEast/nightfox.nvim"),
}

AllColorschemes = {
	"nightly",
	"everforest",
	"catppuccin-latte",
	"catppuccin-macchiato",
	"dawnfox",
	"duskfox",
	"nordfox",
}

Theme_utils = Root .. "theme.utils."

require(Theme_utils .. "disableItalic")
require(Theme_utils .. "setColors")
require(Theme_utils .. "setColorscheme")

return Colorschemes
