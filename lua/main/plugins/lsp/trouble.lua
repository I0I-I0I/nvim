local M = {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
}

function M.config()
	require("trouble").setup({})

	Bind({
		["n"] = {
			["<plugleader>tD"] = {
				"<cmd>Trouble diagnostics toggle focus=true preview.type=float<cr>",
				{ silent = true, noremap = true },
			},

			["<plugleader>td"] = {
				"<cmd>Trouble diagnostics toggle focus=true preview.type=float filter.buf=0<cr>",
				{ desc = "Buffer Diagnostics (Trouble)" },
			},

			["<plugleader>tq"] = {
				"<cmd>Trouble qflist toggle focus=true preview.type=float<cr>",
				{ desc = "Buffer Diagnostics (Trouble)" },
			},
		},
	})
end

return M
