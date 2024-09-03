vim.g.utils_path = "utils"
vim.g.plugins_path = "plugins."
vim.g.lsp_path = vim.g.plugins_path .. "lsp."

-- Default
require("settings.config")
require("settings.mappings")

-- Plugins/LSP
require(vim.g.plugins_path .. "lazy")

-- Current color scheme
require("colorscheme.theme")
