local M = {
	dir = vim.fn.stdpath("config") .. "/plugins/rupilot",
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
}

M.keys = {
	{ "<leader>c", function ()
		vim.cmd("Rupilot " .. vim.fn.input("How I can help you? "))
	end, desc = "Rupilot", { silent = true } },
}

return M
