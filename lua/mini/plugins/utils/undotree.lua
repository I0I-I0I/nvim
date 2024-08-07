local M = {
	"mbbill/undotree",
}

function M.init()
	vim.g.undotree_WindowLayout = 3
end

M.keys = {
	{ "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "Open UndoTree" },
}

return M
