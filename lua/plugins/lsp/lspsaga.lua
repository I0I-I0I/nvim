local saga = require("lspsaga")

saga.setup({
	lightbulb = {
		enable = false,
	},
	definition = {
		width = 0.8,
		height = 0.8,
	},
})

local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<leader>lD", "<cmd>Lspsaga diagnostic_jump_next<cr>", opts)
vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<cr>", opts)
vim.keymap.set("n", "<leader>lf", "<cmd>Lspsaga finder<cr>", opts)
vim.keymap.set("n", "<leader>lp", "<cmd>Lspsaga peek_definition<cr>", opts)
vim.keymap.set("n", "<leader>lr", "<cmd>Lspsaga rename<cr>", opts)
vim.keymap.set("n", "<leader>la", "<cmd>Lspsaga code_action<cr>", opts)
vim.keymap.set("n", "<leader>lo", "<cmd>Lspsaga outline<cr>", opts)
