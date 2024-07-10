vim.g.gruvbox_contrast_light = "hard"
vim.g.gruvbox_improved_tabline = 1
vim.g.gruvbox_improved_warnings = 1

Theme = "default.theme."
Theme_utils = Theme .. "utils."
local localTheme = Root .. "theme."

require(Theme .. "setColors")
require(Theme .. "setColorscheme")
require(localTheme .. "setColor")

vim.cmd("SetColor everforest 0")
