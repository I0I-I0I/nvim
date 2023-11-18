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
	-- Start screen
	{
		"willothy/veil.nvim",
		lazy = true,
		dependencies = {
			-- All optional, only required for the default setup.
			-- If you customize your config, these aren't necessary.
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-file-browser.nvim",
		},
		confing = true,
	},

	-- Tree sitter
	{ "nvim-treesitter/nvim-treesitter" },

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

	-- LSP
	{ "neovim/nvim-lspconfig" },

	-- Format
	{ "jose-elias-alvarez/null-ls.nvim" },
	-- JS
	{ "Wansmer/treesj" },

	-- Saga
	{ "nvimdev/lspsaga.nvim" },

	-- Icons
	{ "kyazdani42/nvim-web-devicons" },
	{ "onsails/lspkind.nvim" },

	-- CMP
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },
	{ "hrsh7th/cmp-cmdline" },
	{ "hrsh7th/nvim-cmp" },
	{ "hrsh7th/cmp-nvim-lua" },

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
	-- Emmet
	{ "olrtg/nvim-emmet" },

	-- Mason
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },

	-- AI
	{ "codota/tabnine-nvim", build = "./dl_binaries.sh" },
	{
		"Exafunction/codeium.nvim",
		event = "BufEnter",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"hrsh7th/nvim-cmp",
		},
	},

	-- Tabs
	{ "akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons" },

	-- Toggle term
	{ "akinsho/toggleterm.nvim", version = "*", config = true },

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

	-- CmdLine, Notify, Nui
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {},
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	},

	-- Search
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.4",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

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

	-- Surround
	{ "tpope/vim-surround" },

	--- History file change
	-- { "mbbill/undotree" },

	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
})
