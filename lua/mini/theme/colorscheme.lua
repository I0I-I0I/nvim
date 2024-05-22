Colorschemes = {
	Plug("sainnhe/everforest"),
	Plug("morhetz/gruvbox"),
}

AllColorschemes = {
	"everforest",
	"gruvbox",
}

Theme_utils = Root .. "theme.utils."

vim.g.gruvbox_contrast_light = "hard"
vim.g.gruvbox_improved_tabline = 1
vim.g.gruvbox_improved_warnings = 1

require(Theme_utils .. "setColors")
require(Theme_utils .. "setColorscheme")
require(Theme_utils .. "toggleThemeStyle")

return Colorschemes
