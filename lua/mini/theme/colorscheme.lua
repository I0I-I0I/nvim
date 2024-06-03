ColorschemesPlug = {
	Plug("sainnhe/everforest"),
	Plug("morhetz/gruvbox"),
}

Colorschemes = { { theme_names = {
	"everforest",
	"gruvbox",
} } }

Theme = "default.theme."
Theme_utils = Theme .. "utils."

vim.g.gruvbox_contrast_light = "hard"
vim.g.gruvbox_improved_tabline = 1
vim.g.gruvbox_improved_warnings = 1

require(Theme .. "setColors")
require(Theme .. "setColorscheme")

return ColorschemesPlug
