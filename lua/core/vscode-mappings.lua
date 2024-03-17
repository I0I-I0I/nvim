-- Move string
vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv", { silent = true })
vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv", { silent = true })

-- $ ^
vim.keymap.set({ "v", "n", "x" }, "H", "^")
vim.keymap.set({ "v", "n", "x" }, "L", "$")

-- Insert Enter
vim.keymap.set("i", "<C-Enter>", "<Esc>o")
vim.keymap.set("i", "<S-Enter>", "<Esc>O")
-- Normal/Insert Enter
vim.keymap.set("n", "<C-Enter>", "<cmd>norm o<cr>")
vim.keymap.set("n", "<S-Enter>", "<cmd>norm O<cr>")

-- Insert left, right
vim.keymap.set("i", "<C-h>", "<left>")
vim.keymap.set("i", "<C-l>", "<right>")

-- Not yank with x/s
vim.keymap.set("v", "x", '"_x')
vim.keymap.set("v", "X", '"_X')

vim.keymap.set({ "n", "v" }, "s", '"_s')
vim.keymap.set({ "n", "v" }, "S", '"_S')

-- Search
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Rename
vim.keymap.set("n", "<leader>r", ":%s/\\<<C-r><C-w>\\>//gI<Left><Left><Left>")

-- Explore
vim.keymap.set("n", "<C-b>", ":Ex<Enter>", { silent = true })

-- Tabs
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Turn off search highlight
vim.keymap.set("n", "<leader><space>", ":nohlsearch<cr>", { silent = true })

-- Folding
vim.keymap.set("n", "<space>", "za")

-- Split
vim.keymap.set("n", "<C-w>s", ":split<cr><C-w>j <cmd>Explore .<cr>", { silent = true })
vim.keymap.set("n", "<C-w>v", ":vsplit<cr><C-w>l <cmd>Explore .<cr>", { silent = true })
vim.keymap.set("n", "<C-w>S", ":split ")
vim.keymap.set("n", "<C-w>V", ":vsplit ")
-- Moving to tabs
vim.keymap.set("n", "<C-l>", "<C-w>w")
-- Window tabs
vim.keymap.set("n", "<C-w>c", ":tabclose<Enter>", { silent = true })
