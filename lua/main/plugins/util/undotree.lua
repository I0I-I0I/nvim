local M = {
	"mbbill/undotree",
}

function M.config()
	vim.g.undotree_WindowLayout = 3
end

M.keys = {
	{ "<leader>u", "<cmd>UndotreeToggle<cr>", { silent = true, noremap = true }, desc = "Open UndoTree" },
}

return M
