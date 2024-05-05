local Garbage = {
	"zeioth/garbage-day.nvim",
	dependencies = "neovim/nvim-lspconfig",
	event = "VeryLazy",
	opts = {
		agressive_mode = true,
		notification = true,
	},
}

return Garbage
