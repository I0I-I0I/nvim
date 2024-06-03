Plug = vim.fn["plug#"]

local theme = Root .. "theme."

vim.call("plug#begin")

--
-- Colorscheme --
--
require(theme .. "colorscheme")

--
-- Plugins --
--
Plug("nvim-lua/plenary.nvim")
Plug("nvim-telescope/telescope.nvim", { ["tag"] = "0.1.6" })

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

-- Linter/Foramtter
Plug("stevearc/conform.nvim")

-- Completion
Plug("hrsh7th/nvim-cmp")
Plug("hrsh7th/cmp-nvim-lsp")
Plug("hrsh7th/cmp-cmdline")
-- Snippets
Plug("L3MON4D3/LuaSnip", { ["tag"] = "v2.*", ["do"] = "make install_jsregexp" })
Plug("saadparwaiz1/cmp_luasnip")
Plug("rafamadriz/friendly-snippets")

vim.call("plug#end")

--
-- Config
local plugins = Root .. "plugins.config."

require(plugins .. "quick-scope")
require(plugins .. "telescope")
require(plugins .. "undotree")
require(plugins .. "bbye")
require(plugins .. "scope")
require(plugins .. "surround")
