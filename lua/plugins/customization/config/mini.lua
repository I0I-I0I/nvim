return {
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
}
