local Garbage = {
	"zeioth/garbage-day.nvim",
	dependencies = "neovim/nvim-lspconfig",
	event = { "BufRead", "BufNewFile" },
	opts = {
		notification = true,
	},
}

return Garbage
