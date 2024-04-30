return {
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
}
