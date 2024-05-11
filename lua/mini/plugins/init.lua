Plug = vim.fn["plug#"]

local lsp = "mini.lsp."
local plugins = "mini.plugins."

vim.call("plug#begin")

-- Colorscheme
Plug("folke/tokyonight.nvim")

-- Plugins
require(plugins .. "plugins")

-- LSP
require(lsp .. "plugins")

vim.call("plug#end")

-- Config
local config = "mini.plugins.config."

require(config .. "telescope")
require(config .. "trouble")
require(config .. "gitsign")
require(config .. "harpoon")
require(config .. "undotree")
