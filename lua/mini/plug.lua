local Plug = vim.fn["plug#"]

vim.call("plug#begin")

-- Telescope
Plug("nvim-lua/plenary.nvim")
Plug("nvim-telescope/telescope.nvim", { ["tag"] = "0.1.6" })

-- Harpoon
Plug("ThePrimeagen/harpoon")

-- Git
Plug("lewis6991/gitsigns.nvim")

-- Trouble
Plug("folke/trouble.nvim")

-- Cmp
Plug("hrsh7th/cmp-nvim-lsp")
Plug("hrsh7th/cmp-cmdline")
Plug("hrsh7th/nvim-cmp")
-- Plug("hrsh7th/cmp-buffer")

-- Undotree
Plug("mbbill/undotree")

-- Colors
Plug("folke/tokyonight.nvim")

vim.call("plug#end")

local plugins = "mini.plugins."

require(plugins .. "telescope")
require(plugins .. "trouble")
require(plugins .. "gitsign")
require(plugins .. "harpoon")
require(plugins .. "undotree")
