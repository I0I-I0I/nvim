local M = {
	"moll/vim-bbye",
	event = "VeryLazy",
}

function M.config()
	local opts = { silent = true, noremap = true }

	Bind({
		["n"] = {
			["<plugleader>q"] = { "<cmd>Bdelete<cr>", opts, desc = "Close buffer" },
			["<plugleader>Q"] = { "<cmd>Bdelete!<cr>", opts, desc = "Close buffer!" },
			["<plugleader>aq"] = { "<cmd>bufdo :Bdelete<cr>", opts, desc = "Close all buffers" },
			["<plugleader>aQ"] = { "<cmd>bufdo :Bdelete!<cr>", opts, desc = "Close all buffers!" },
			["<plugleader>c"] = { "<cmd>Bdelete<cr><cmd>close<cr>", opts, desc = "Close buffer and window" },
			["<plugleader>C"] = { "<cmd>Bdelete!<cr><cmd>close<cr>", opts, desc = "Close buffer and window!" },
		},
	})
end

return M
