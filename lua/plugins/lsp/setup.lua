return {
	-- Mason
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
		config = function()
			require("plugins.lsp.config.mason")
		end,
	},

	-- LSP
	{
		"VonHeikemen/lsp-zero.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
		},
		branch = "v3.x",
		lazy = true,
		config = function()
			require("plugins.lsp.config.lspzero")
		end,
	},

	-- CMP
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-cmdline" },
			{ "hrsh7th/cmp-path" },
			{ "lukas-reineke/cmp-under-comparator" },
		},
		event = "InsertEnter",
		config = function()
			require("plugins.lsp.config.cmp")
		end,
	},

	-- Snipets
	{
		"L3MON4D3/LuaSnip",
		lazy = true,
		version = "v2.*",
		build = "make install_jsregexp",
		dependencies = { "rafamadriz/friendly-snippets" },
	},
	{ "saadparwaiz1/cmp_luasnip" },

	-- AI
	-- {
	-- 	"codota/tabnine-nvim",
	-- 	build = "./dl_binaries.sh",
	-- 	config = function()
	-- 		require("plugins.lsp.config.ai.tabnine")
	-- 	end,
	-- },
	{
		"Exafunction/codeium.nvim",
		lazy = true,
		config = function()
			require("plugins.lsp.config.ai.codeium")
		end,
	},

	-- Formatter
	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("plugins.lsp.config.formatter")
		end,
	},
	-- Linter
	{
		"mfussenegger/nvim-lint",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("plugins.lsp.config.lint")
		end,
	},

	-- Tools
	{
		"nvimdev/lspsaga.nvim",
		event = "BufEnter",
		config = function()
			require("plugins.lsp.config.lspsaga")
		end,
	},

	-- Visual loading
	{
		"j-hui/fidget.nvim",
		config = function()
			require("plugins.lsp.config.fidget")
		end,
	},

	-- TypeScript
	{
		"pmizio/typescript-tools.nvim",
		ft = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact", "javascript.tsx" },
		config = function()
			require("plugins.lsp.config.typescript")
		end,
	},

	-- Optimization
	{
		"zeioth/garbage-day.nvim",
		dependencies = "neovim/nvim-lspconfig",
		lazy = true,
		opts = {
			notification = true,
		},
	},
}
