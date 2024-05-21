Plug = vim.fn["plug#"]

local lsp = Root .. "lsp."
local plugins = Root .. "plugins."
local theme = Root .. "theme."

vim.call("plug#begin")

-- Colorscheme
require(theme .. "colorscheme")

-- Plugins
require(plugins .. "plugins")

-- LSP
require(lsp .. "plugins")

vim.call("plug#end")

-- Config
local config = plugins .. "config."

require(config .. "telescope")
require(config .. "gitsign")
require(config .. "undotree")
require(config .. "bbye")
require(config .. "scope")
require(config .. "treesitter")
require(config .. "surround")
