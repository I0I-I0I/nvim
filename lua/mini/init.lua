vim.g.config_path = "mini"

local default_path = "default."
local root_path = "mini."
local custom_path = root_path .. "custom."
vim.g.plugins_path = root_path .. "plugins."
vim.g.lsp_path = vim.g.plugins_path .. "lsp."

-- Default
require(default_path .. "init")

-- Plugins/LSP
require(vim.g.plugins_path .. "lazy")

-- Custom
require(custom_path .. "config")

-- Current color scheme
require(vim.g.config_path .. ".colorscheme.theme")
