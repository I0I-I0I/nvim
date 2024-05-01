local Bbye = {
	"moll/vim-bbye",
	cmd = { "Bdelete" },
	keys = {
		{ "<leader>q", "<cmd>Bdelete<cr>", desc = "Buffer Close" },
		{ "<leader>Q", "<cmd>Bdelete!<cr>", desc = "Buffer Close All" },
	},
}

function Bbye.config()
	vim.keymap.set("n", "<leader>q", "<cmd>Bdelete<cr>", { silent = true })
	vim.keymap.set("n", "<leader>Q", "<cmd>Bdelete!<cr>", { silent = true })
end

return Bbye
