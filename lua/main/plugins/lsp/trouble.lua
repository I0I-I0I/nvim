local M = {
	"folke/trouble.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
}

M.cmd = { "Trouble" }

M.opts = {}

M.keys = {
	{
		"<leader>tD",
		"<cmd>Trouble diagnostics toggle focus=true<cr>",
		{ silent = true, noremap = true },
		desc = "Project Diagnostics (Trouble)",
	},

	{
		"<leader>td",
		"<cmd>Trouble diagnostics toggle focus=true filter.buf=0<cr>",
		desc = "Buffer Diagnostics (Trouble)",
	},

	{ "<leader>tq", "<cmd>Trouble qflist toggle focus=true<cr>", desc = "Buffer qflist (Trouble)" },

	{ "<leader>ts", "<cmd>Trouble symbols toggle focus=true<cr>", desc = "Buffer Symbols (Trouble)" },
}

return M
