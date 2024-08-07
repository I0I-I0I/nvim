local M = {
	"tiagovla/scope.nvim",
	opts = {},
}

function M.init()
	vim.opt.sessionoptions = {
		"buffers",
		"tabpages",
		"globals",
	}
end

local opts = { silent = true }

M.keys = {
	{ "<leader>m1", "<cmd>ScopeMoveBuf 1<cr>", opts, desc = "Move buffer to tab 1" },
	{ "<leader>m2", "<cmd>ScopeMoveBuf 2<cr>", opts, desc = "Move buffer to tab 2" },
	{ "<leader>m3", "<cmd>ScopeMoveBuf 3<cr>", opts, desc = "Move buffer to tab 3" },
	{ "<leader>m4", "<cmd>ScopeMoveBuf 4<cr>", opts, desc = "Move buffer to tab 4" },
}

return M
