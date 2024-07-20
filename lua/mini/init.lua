Path_to_config = "~/.config/nvim/lua/mini/"
Root = "mini."

-- Vars
local default = "default."
local plugins = Root .. "plugins."
local lsp = Root .. "lsp."
local theme = Root .. "theme."
local custom = Root .. "custom."

-- Default
require(default .. "config")
require(default .. "mappings")

-- Utils
require(default .. "utils.betterFind")

-- Plugins/LSP
require(plugins .. "plug")
require(lsp .. "lsp")

-- Custom
require(custom .. "config")
require(custom .. "mappings")

-- Current colorscheme
require(theme .. "colorscheme")
require(theme .. "theme")
