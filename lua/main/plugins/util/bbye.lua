local M = {
	"moll/vim-bbye",
	event = "VeryLazy",
}

function M.config()
	local opts = { silent = true, noremap = true }

	Bind({
		["n"] = {
			["<plugleader>q"] = { "<cmd>Bdelete<cr>", opts },
			["<plugleader>Q"] = { "<cmd>Bdelete!<cr>", opts },
			["<plugleader>aq"] = { "<cmd>bufdo :Bdelete<cr>", opts },
			["<plugleader>aQ"] = { "<cmd>bufdo :Bdelete!<cr>", opts },
			["<plugleader>c"] = { "<cmd>Bdelete<cr><cmd>close<cr>", opts },
			["<plugleader>C"] = { "<cmd>Bdelete!<cr><cmd>close<cr>", opts },
		},
	})
end

return M
