local Trouble = {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	cmd = "Trouble",
	keys = {
		{
			"<leader>tD",
			"<cmd>Trouble diagnostics toggle focus=true preview.type=float<cr>",
			{ silent = true, noremap = true },
		},
		{
			"<leader>td",
			"<cmd>Trouble diagnostics toggle focus=true preview.type=float filter.buf=0<cr>",
			desc = "Buffer Diagnostics (Trouble)",
		},
		{
			"<leader>tq",
			"<cmd>Trouble qflist toggle focus=true preview.type=float<cr>",
			desc = "Buffer Diagnostics (Trouble)",
		},
	},
}

function Trouble.config()
	require("trouble").setup({})
end

return Trouble
