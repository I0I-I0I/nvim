require("trouble").setup({
	icons = false,
})

local opts = { silent = true, noremap = true }

vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>", opts)
vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle workspace_diagnostics<cr>", opts)
