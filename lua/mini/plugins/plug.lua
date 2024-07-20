Plug = vim.fn["plug#"]

vim.call("plug#begin")

--
-- Colorscheme --
--
Plug("sainnhe/everforest")
Plug("zenbones-theme/zenbones.nvim")
Plug("rktjmp/lush.nvim")
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

-- Nvim tree
Plug("nvim-tree/nvim-tree.lua")

-- Telescope
Plug("nvim-telescope/telescope.nvim", { ["branch"] = "0.1.x" })
Plug("nvim-lua/plenary.nvim")

-- Treesitter
Plug("nvim-treesitter/nvim-treesitter", { ["do"] = ":TSUpdate" })

--
-- LSP --
--
-- Mason
Plug("williamboman/mason.nvim")

-- Completion
Plug("hrsh7th/nvim-cmp")
Plug("hrsh7th/cmp-nvim-lsp")
Plug("hrsh7th/cmp-cmdline")
Plug("hrsh7th/cmp-buffer")

-- Foramtter
Plug("stevearc/conform.nvim")

-- AI
Plug("Exafunction/codeium.vim", { ["branch"] = "main" })

vim.call("plug#end")

--
-- Config
local plugins = Root .. "plugins.config."

require(plugins .. "quick-scope")
require(plugins .. "undotree")
require(plugins .. "scope")
require(plugins .. "bbye")
require(plugins .. "surround")
require(plugins .. "nvim-tree")
require(plugins .. "ai")
require(plugins .. "telescope")
require(plugins .. "treesitter")
