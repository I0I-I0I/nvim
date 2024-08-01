local M = {
	"mbbill/undotree",
}

function M.config()
	Bind({
		["n"] = {
			["<plugleader>u"] = { "<cmd>UndotreeToggle<cr>", { silent = true, noremap = true }, desc = "Open UndoTree" },
		},
	})
	vim.g.undotree_WindowLayout = 3
end

return M
