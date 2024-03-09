return {
	-- Dropbar
	{
		"Bekaboo/dropbar.nvim",
		dependencies = {
			"nvim-telescope/telescope-fzf-native.nvim",
		},
		config = function()
			require("plugins.util.config.dropbar")
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

	-- Tree sitter
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
			"windwp/nvim-ts-autotag",
		},
		config = function()
			require("plugins.util.config.treesitter")
		end,
	},
	{
		"altermo/ultimate-autopair.nvim",
		branch = "v0.6",
		opts = {},
	},

	-- JS
	{
		"Wansmer/treesj",
		config = function()
			require("plugins.util.config.treejs")
		end,
	},

	-- Buffers
	{
		"moll/vim-bbye",
		config = function()
			require("plugins.util.config.bbye")
		end,
	},

	-- Comments
	{ "tomtom/tcomment_vim" },

	-- Time
	{ "wakatime/vim-wakatime" },
}
