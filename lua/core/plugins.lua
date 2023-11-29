local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{ "nvim-lua/plenary.nvim" },
	{ "nvim-tree/nvim-web-devicons" },
	{ "MunifTanjim/nui.nvim" },

	-- Start screen
	{
		"willothy/veil.nvim",
		lazy = true,
		dependencies = { "nvim-telescope/telescope-file-browser.nvim" },
		confing = true,
	},

	-- Tree sitter
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
			"windwp/nvim-ts-autotag",
		},
	},
	{
		"altermo/ultimate-autopair.nvim",
		event = { "InsertEnter", "CmdlineEnter" },
		branch = "v0.6", --recomended as each new version will have breaking changes
		opts = {
			--Config goes here
		},
	},

	-- Tree
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
	},

	-- LSP
	{ "neovim/nvim-lspconfig" },
	{ "j-hui/fidget.nvim" },

	-- Format
	{ "jose-elias-alvarez/null-ls.nvim" },

	-- Saga
	{ "nvimdev/lspsaga.nvim" },

	-- Icons
	{ "kyazdani42/nvim-web-devicons" },
	{ "onsails/lspkind.nvim" },
	-- CMP
	{ "hrsh7th/nvim-cmp" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-cmdline" },
	-- { "hrsh7th/cmp-path" },
	-- { "hrsh7th/cmp-nvim-lsp-signature-help" },

	-- Snipets
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
		build = "make install_jsregexp",
		dependencies = { "rafamadriz/friendly-snippets" },
	},
	{ "saadparwaiz1/cmp_luasnip" },

	-- Mason
	{ "williamboman/mason.nvim" },

	-- AI
	{ "codota/tabnine-nvim", build = "./dl_binaries.sh" },
	{ "Exafunction/codeium.nvim", event = "BufEnter" },

	-- JS
	{ "Wansmer/treesj" },

	-- Tabs
	{ "akinsho/bufferline.nvim", version = "*" },

	-- Buffers
	{ "moll/vim-bbye" },

	-- CmdLine, Notify
	{ "folke/noice.nvim", event = "VeryLazy" },
	{ "rcarriga/nvim-notify" },

	-- Search
	{ "nvim-telescope/telescope.nvim", tag = "0.1.4" },

	-- Git
	{ "lewis6991/gitsigns.nvim" },

	-- Lab
	{
		"0x100101/lab.nvim",
		build = "cd js && npm ci",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	-- Comments
	{ "tomtom/tcomment_vim" },

	-- Move
	{ "ggandor/leap.nvim" },
	{ "ThePrimeagen/harpoon" },
	{ "ghillb/cybu.nvim", branch = "main" },

	-- Cursor
	{ "m-demare/hlargs.nvim" },
	{ "norcalli/nvim-colorizer.lua" },

	-- Surround
	{ "kylechui/nvim-surround", version = "*" },

	-- Time
	{ "wakatime/vim-wakatime" },

	-- Smooth
	{ "yuttie/comfortable-motion.vim" },

	-- Themes
	{ "lunacookies/vim-substrata" },
	{ "rebelot/kanagawa.nvim" },

	-- Zen mode
	{
		"Pocco81/true-zen.nvim",
	},
})
