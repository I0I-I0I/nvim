return {
	{
		"rcarriga/nvim-notify",
		lazy = false,
		config = function()
			require("notify").setup({
				background_colour = "#000000",
				max_width = 50,
				render = "wrapped-compact",
				stages = "slide",
			})
		end,
	},
}
