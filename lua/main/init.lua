vim.g.config_path = "main"

local root = "main."
local default_path = "default."
vim.g.colorscheme_path = default_path .. "colorscheme."
vim.g.plugins_path = root .. "plugins."

require(default_path .. "init")
require(vim.g.plugins_path .. "lazy")
require(vim.g.config_path .. ".colorscheme.theme")
