local M = {
	"moll/vim-bbye",
}

M.cmd = { "Bdelete", "Bwipeout" }

local opts = { silent = true, noremap = true }

M.keys = {
	{ "<leader>q", "<cmd>Bdelete<cr>", opts, desc = "Close buffer" },
	{ "<leader>Q", "<cmd>Bdelete!<cr>", opts, desc = "Close buffer!" },
	{ "<leader>aq", "<cmd>bufdo :Bdelete<cr>", opts, desc = "Close all buffers" },
	{ "<leader>aQ", "<cmd>bufdo :Bdelete!<cr>", opts, desc = "Close all buffers!" },
	{ "<leader>c", "<cmd>Bdelete<cr><cmd>close<cr>", opts, desc = "Close buffer and window" },
	{ "<leader>C", "<cmd>Bdelete!<cr><cmd>close<cr>", opts, desc = "Close buffer and window!" },
}

return M
