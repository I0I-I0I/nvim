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
	-- Treesitter
	{ "nvim-treesitter/nvim-treesitter" },

	-- Surround
	{ "tpope/vim-surround" },

	-- Tree
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
	},
	-- Tabs
	{ "akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons" },

	-- Themes
	{ "folke/lsp-colors.nvim" },
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{ "akinsho/horizon.nvim", version = "*" },
	{ "joshdick/onedark.vim" },
	{ "rebelot/kanagawa.nvim" },
	{ "mhartington/oceanic-next" },
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	{ "nobbmaestro/nvim-andromeda" },
	{ "tjdevries/colorbuddy.nvim", branch = "dev" },
	-- Emmet
	{ "olrtg/nvim-emmet" },

	-- Icons
	{ "kyazdani42/nvim-web-devicons" },
	{ "onsails/lspkind.nvim" },

	--
	-- lazy.nvim
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {},
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	},

	-- LSP
	{ "neovim/nvim-lspconfig" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },
	{ "hrsh7th/cmp-cmdline" },
	{ "hrsh7th/nvim-cmp" },

	-- Snipets
	{
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!).
		build = "make install_jsregexp",
		dependencies = { "rafamadriz/friendly-snippets" },
	},
	{ "saadparwaiz1/cmp_luasnip" },

	{ "nvimdev/lspsaga.nvim" },

	-- AI
	{ "codota/tabnine-nvim", build = "./dl_binaries.sh" },
	{
		"tzachar/cmp-tabnine",
		build = "./install.sh",
		dependencies = "hrsh7th/nvim-cmp",
	},
	{
		"Exafunction/codeium.nvim",
		event = "BufEnter",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"hrsh7th/nvim-cmp",
		},
	},
	-- Notifications
	{
		"j-hui/fidget.nvim",
		opts = {},
	},
	-- Conform
	{
		"stevearc/conform.nvim",
		opts = {},
	},
	-- Mason
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },

	-- Search
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.4",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	-- Format
	{ "jose-elias-alvarez/null-ls.nvim" },

	-- Auto close
	{ "windwp/nvim-autopairs" },
	{ "windwp/nvim-ts-autotag" },

	-- Comments
	{ "terrortylor/nvim-comment" },

	-- Git
	{ "tpope/vim-fugitive" },
	{ "lewis6991/gitsigns.nvim" },

	-- Moving
	{ "phaazon/hop.nvim" },
	{ "ThePrimeagen/harpoon" },

	--- History file change
	-- { "mbbill/undotree" },

	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
})
