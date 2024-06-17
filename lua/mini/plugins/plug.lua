Plug = vim.fn["plug#"]

local theme = Root .. "theme."

vim.call("plug#begin")

--
-- Colorscheme --
--
Plug("sainnhe/everforest")
Plug("morhetz/gruvbox")
Plug("mhartington/oceanic-next")

--
-- Plugins --
--
-- Scope
Plug("tiagovla/scope.nvim")

-- Surround
Plug("kylechui/nvim-surround", { ["tag"] = "*" })

-- Undotree
Plug("mbbill/undotree")

-- Bdelete
Plug("moll/vim-bbye")

-- Quick-scope
Plug("unblevable/quick-scope")

--
-- LSP --
--
Plug("williamboman/mason.nvim")

-- Foramtter
Plug("stevearc/conform.nvim")

vim.call("plug#end")

--
-- Config
local plugins = Root .. "plugins.config."

require(plugins .. "quick-scope")
require(plugins .. "undotree")
require(plugins .. "bbye")
require(plugins .. "scope")
require(plugins .. "surround")
