Path_to_config = "~/.config/nvim/lua/mini/"
Root = "mini."

-- Vars
local plugins = Root .. "plugins."
local lsp = Root .. "lsp."
local theme = Root .. "theme."
local custom = Root .. "custom."

-- Default
require("default.config")
require("default.mappings")

-- Plugins/LSP
require(plugins .. "plug")
require(lsp .. "lsp")

-- Custom
require(custom .. "config")
require(custom .. "mappings")

-- Current colorscheme
require(theme .. "theme")

vim.cmd([[
    highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
    highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
]])
