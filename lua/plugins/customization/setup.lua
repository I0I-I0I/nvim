return {
	{ "nvim-lua/plenary.nvim" },
	{ "MunifTanjim/nui.nvim" },

	-- Tabs
	{
		"akinsho/bufferline.nvim",
		event = "BufEnter",
		version = "*",
		config = function()
			require("plugins.customization.config.bufferline")
		end,
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		event = "BufRead",
		lazy = true,
		opts = {},
		config = function()
			require("ibl").setup()
		end,
	},

	-- Mini
	{
		"echasnovski/mini.animate",
		version = false,
		event = "BufRead",
		lazy = true,
		config = function()
			require("mini.animate").setup()
		end,
	},
	{
		"echasnovski/mini.ai",
		event = "BufRead",
		lazy = true,
		version = false,
	},
	{
		"echasnovski/mini.bracketed",
		event = "BufRead",
		lazy = true,
		version = false,
	},
	-- Highlight the word under cursor
	{
		"echasnovski/mini.cursorword",
		event = "BufRead",
		lazy = true,
		version = false,
	},

	-- Undo
	{
		"tzachar/highlight-undo.nvim",
		keys = {
			{ "u", desc = "Undo" },
		},
		config = true,
		event = "VeryLazy",
	},

	-- Css colors
	{
		"norcalli/nvim-colorizer.lua",
		event = "VeryLazy",
		config = function()
			require("colorizer").setup()
		end,
	},

	-- HlArgs
	{
		"m-demare/hlargs.nvim",
		event = "BufRead",
		lazy = true,
		config = function()
			require("hlargs").setup()
		end,
	},

	-- CmdLine, Notify
	{
		"folke/noice.nvim",
		lazy = false,
		config = function()
			require("plugins.customization.config.noice")
		end,
	},
	{
		"rcarriga/nvim-notify",
		lazy = false,
		config = function()
			require("plugins.customization.config.notify")
		end,
	},

	-- Rainbow Brackets
	{
		"HiPhish/rainbow-delimiters.nvim",
		event = "BufEnter",
		lazy = true,
		config = function()
			require("plugins.customization.config.rainbow-brackets")
		end,
	},

	-- Start screen
	{
		"willothy/veil.nvim",
		dependencies = {
			"nvim-telescope/telescope-file-browser.nvim",
		},
		lazy = false,
		priority = 1000,
		config = function()
			require("plugins.customization.config.veil")
		end,
	},

	-- Icons
	{
		"nvim-tree/nvim-web-devicons",
		lazy = true,
		config = function()
			require("plugins.customization.config.icons.icons")
		end,
	},
	{
		"onsails/lspkind.nvim",
		lazy = true,
		config = function()
			require("plugins.customization.config.icons.lspkind")
		end,
	},
}
