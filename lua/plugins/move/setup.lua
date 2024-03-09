return {
	-- Move
	{
		"ggandor/leap.nvim",
		lazy = true,
		event = "BufEnter",
		config = function()
			require("plugins.move.config.leap")
		end,
	},
	{
		"ThePrimeagen/harpoon",
		config = function()
			require("plugins.move.config.harpoon")
		end,
	},
	{
		"ghillb/cybu.nvim",
		branch = "main",
		config = function()
			require("plugins.move.config.cybu")
		end,
	},

	-- Tree
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		config = function()
			require("plugins.move.config.tree")
		end,
	},

	-- Search
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.4",
		config = function()
			require("plugins.move.config.telescope")
		end,
	},
}
