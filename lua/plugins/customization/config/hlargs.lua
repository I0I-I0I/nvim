return {
	{
		"m-demare/hlargs.nvim",
		event = "BufRead",
		lazy = true,
		config = function()
			require("hlargs").setup()
		end,
	},
}
