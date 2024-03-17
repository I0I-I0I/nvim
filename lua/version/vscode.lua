-- Basic
require("core.vscode-config")

-- Plugins
require("plugins.manager")

require("lazy").setup({
	{ "nvim-lua/plenary.nvim" },
	{ "MunifTanjim/nui.nvim" },

	-- Move
	{
		"ggandor/leap.nvim",
		lazy = true,
		event = "BufEnter",
		config = function()
			require("plugins.move.config.leap")
		end,
	},

	-- Surround
	{
		"kylechui/nvim-surround",
		version = "*",
		config = function()
			require("plugins.util.config.surround")
		end,
	},

	-- Comments
	{ "tomtom/tcomment_vim" },

	-- Time
	{ "wakatime/vim-wakatime" },
})
