local M = {
	"moll/vim-bbye",
	event = "VeryLazy",
}

function M.config()
	Bind({
		["n"] = {
			["<plugleader>q"] = { "<cmd>Bdelete<cr>", { silent = true, noremap = true } },
			["<plugleader>Q"] = { "<cmd>Bdelete!<cr>", { silent = true, noremap = true } },
		},
	})
end

return M
