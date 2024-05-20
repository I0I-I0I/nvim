local Trouble = {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	branch = "dev",
	event = "BufRead",
}

function Trouble.config()
	require("trouble").setup({})

	local opts = { silent = true, noremap = true }

	vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", opts)
	vim.keymap.set("n", "<leader>xd", "<cmd>Trouble symbols toggle<cr>", opts)
	vim.keymap.set("n", "<leader>xD", "<cmd>Trouble lsp_document_symbols toggle<cr>", opts)
end

return Trouble
