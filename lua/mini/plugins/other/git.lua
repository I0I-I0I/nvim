local M = {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
	config = true,
}

M.keys = {
	{ "<leader>g", "<cmd>Neogit<cr>", { silent = true } },
}

return M
