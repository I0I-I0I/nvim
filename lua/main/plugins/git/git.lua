local M = {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
}

function M.config()
	require("neogit").setup({})
end

M.keys = {
	{ "<leader>G", "<cmd>Neogit<cr>", { silent = true } },
}

return M
