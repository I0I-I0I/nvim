local M = {
	dir = vim.fn.stdpath("config") .. "/plugins/rupilot",
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
}

M.keys = {
	{ "<leader>c", "<cmd>Rupilot<cr>", desc = "Rupilot", { silent = true } },
}

return M
