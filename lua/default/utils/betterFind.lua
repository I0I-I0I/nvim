--
-- Find words

vim.cmd("set wildignore+=node_modules/**")
vim.cmd("set wildignore+=.git/**")
vim.cmd("set wildignore+=dist/**")

vim.keymap.set("n", "<leader>fg", ":grep ")

--
-- Find files

vim.cmd("set path+=src/**,~/.config/nvim/**")

vim.keymap.set("n", "<leader>ff", ":find ")

vim.cmd([[
    set grepprg=rg\ --vimgrep\ --smart-case\ --follow
]])
