local M = {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim", -- required
		"sindrets/diffview.nvim", -- optional
		"nvim-telescope/telescope.nvim", -- optional
	},
	config = true,
}

M.keys = {
	{ "<leader>g", "<cmd>Neogit<cr>", { silent = true } },
}

return M
