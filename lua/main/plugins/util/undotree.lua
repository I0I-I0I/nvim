local M = {
	"mbbill/undotree",
}

function M.config()
	Bind({
		["n"] = {
			["<plugleader>u"] = { "<cmd>UndotreeToggle<cr>" },
		},
	})
	vim.g.undotree_WindowLayout = 3
end

return M
