local M = {
	"mbbill/undotree",
	event = "VeryLazy",
}

function M.config()
	Bind({
		["n"] = {
			["<plugleader>u"] = { "<cmd>UndotreeToggle<cr>" },
		},
	})

	vim.cmd([[
    let g:undotree_WindowLayout = 3
]])
end

return M
