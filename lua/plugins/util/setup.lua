return {
	-- Dropbar
	{
		"Bekaboo/dropbar.nvim",
		dependencies = {
			"nvim-telescope/telescope-fzf-native.nvim",
		},
		event = "BufEnter",
		config = function()
			require("plugins.util.config.dropbar")
		end,
	},

	-- Surround
	{
		"kylechui/nvim-surround",
		version = "*",
		event = "BufEnter",
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
		event = "BufEnter",
		config = function()
			require("plugins.util.config.treesitter")
		end,
	},
	{
		"altermo/ultimate-autopair.nvim",
		event = "BufEnter",
		branch = "v0.6",
		opts = {},
	},

	-- JS
	{
		"Wansmer/treesj",
		keys = {
			{ "<leader>j", "<cmd>TSJToggle<cr>", desc = "Join Toggle" },
		},
		config = function()
			require("plugins.util.config.treejs")
		end,
	},

	-- Buffers
	{
		"moll/vim-bbye",
		keys = {
			{ "<leader>q", "<cmd>Bdelete<cr>", desc = "Buffer Close" },
			{ "<leader>Q", "<cmd>Bdelete!<cr>", desc = "Buffer Close All" },
		},
		config = function()
			require("plugins.util.config.bbye")
		end,
	},

	-- Comments
	{
		"tomtom/tcomment_vim",
		event = "BufEnter",
	},

	-- Time
	{
		"wakatime/vim-wakatime",
		event = "BufEnter",
	},
}
