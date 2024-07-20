local M = {
	"mbbill/undotree",
	keys = { "<leader>u" },
}

function M.config()
	vim.keymap.set("n", "<leader>u", "<cmd>UndotreeToggle<cr>")
	vim.g.undotree_WindowLayout = 3
end

return M
