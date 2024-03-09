return {
	{ "nvim-lua/plenary.nvim" },
	{ "MunifTanjim/nui.nvim" },

	-- Animation
	-- { "yuttie/comfortable-motion.vim" },

	-- Tabs
	{
		"akinsho/bufferline.nvim",
		version = "*",
		config = function()
			require("plugins.customization.config.bufferline")
		end,
	},

	{
		"echasnovski/mini.indentscope",
		version = false,
		config = function()
			require("mini.indentscope").setup()
		end,
	},
	{
		"echasnovski/mini.animate",
		version = false,
		config = function()
			require("mini.animate").setup()
		end,
	},

	-- Undo
	{
		"tzachar/highlight-undo.nvim",
		config = true,
		event = "VeryLazy",
	},

	-- Css colors
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},

	-- HlArgs
	{
		"m-demare/hlargs.nvim",
		config = function()
			require("hlargs").setup()
		end,
	},

	-- CmdLine, Notify
	{
		"folke/noice.nvim",
		config = function()
			require("plugins.customization.config.noice")
		end,
	},
	{
		"rcarriga/nvim-notify",
		config = function()
			require("plugins.customization.config.notify")
		end,
	},

	-- Rainbow Brackets
	{
		"HiPhish/rainbow-delimiters.nvim",
		config = function()
			require("plugins.customization.config.rainbow-brackets")
		end,
	},

	-- Start screen
	{
		"willothy/veil.nvim",
		dependencies = { "nvim-telescope/telescope-file-browser.nvim" },
		priority = 1000,
		config = function()
			require("plugins.customization.config.veil")
		end,
	},

	-- Icons
	{
		"nvim-tree/nvim-web-devicons",
		config = function()
			require("plugins.customization.config.icons.icons")
		end,
	},
	{
		"onsails/lspkind.nvim",
		config = function()
			require("plugins.customization.config.icons.lspkind")
		end,
	},
}
