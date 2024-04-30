return {
	{
		"ghillb/cybu.nvim",
		branch = "main",
		event = "BufEnter",
		config = function()
			local cybu = require("cybu")

			cybu.setup({})

			vim.keymap.set("n", "<C-k>", "<Plug>(CybuPrev)")
			vim.keymap.set("n", "<C-j>", "<Plug>(CybuNext)")
		end,
	},
}
