local M = {
	"zeioth/garbage-day.nvim",
	dependencies = "neovim/nvim-lspconfig",
	event = "BufRead",
	opts = {
		agressive_mode = true,
		notification = true,
	},
}

return M
