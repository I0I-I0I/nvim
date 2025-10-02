vim.pack.add({
    "https://github.com/kristijanhusak/vim-dadbod-ui",
    "https://github.com/tpope/vim-dadbod",
    "https://github.com/kristijanhusak/vim-dadbod-completion"})

vim.keymap.set("n", "<leader>D", "<cmd>DBUIToggle<CR>")
vim.keymap.set("n", "<leader>k", "<cmd>DBUILastQueryInfo<CR>")
