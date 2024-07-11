local Bbye = {
	"moll/vim-bbye",
	cmd = { "Bdelete" },
	keys = {
		{ "<leader>q", "<cmd>Bdelete<cr>", desc = "Close buffer" },
		{ "<leader>Q", "<cmd>Bdelete!<cr>", desc = "Force close buffer" },
		{ "<leader>c", "<cmd>Bdelete<cr><cmd>close<cr>", desc = "Close buffer and close window/split" },
		{ "<leader>C", "<cmd>Bdelete!<cr><cmd>close<cr>", desc = "Force close buffer and close window/split" },
	},
}

function Bbye.config()
	local opts = { silent = true, noremap = true }

	vim.keymap.set("n", "<leader>q", "<cmd>Bdelete<cr>", opts)
	vim.keymap.set("n", "<leader>Q", "<cmd>Bdelete!<cr>", opts)
	vim.keymap.set("n", "<leader>aq", "<cmd>bufdo :Bdelete<cr>", opts)
	vim.keymap.set("n", "<leader>aQ", "<cmd>bufdo :Bdelete!<cr>", opts)
	vim.keymap.set("n", "<leader>c", "<cmd>Bdelete<cr><cmd>close<cr>", opts)
	vim.keymap.set("n", "<leader>C", "<cmd>Bdelete!<cr><cmd>close<cr>", opts)
end

return Bbye
