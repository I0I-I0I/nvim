vim.g.mapleader = ","

-- Move string
vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv", { silent = true })
vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv", { silent = true })

-- Move screen
-- vim.keymap.set("n", "<C-d>", "<C-d>zz")
-- vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Terminal
vim.keymap.set("n", "<C-\\>", "<cmd>split <cr><C-w>J<cmd>resize 10<cr><cmd>term<cr>i", { silent = true })
vim.keymap.set("t", "<C-\\>", "<cmd>Bdelete!<cr><cmd>close<cr>", { silent = true })

-- Not yank with x/s
vim.keymap.set("v", "x", '"_x')
vim.keymap.set("v", "X", '"_X')
vim.keymap.set("v", "s", '"_s')
vim.keymap.set("v", "S", '"_s')

-- Paste
vim.keymap.set("x", "<leader>p", '"_dP')
vim.keymap.set("n", "<F2>", ":set paste<cr>", { silent = true })
vim.keymap.set("n", "<F3>", ":set nopaste<cr>", { silent = true })
vim.keymap.set("i", "<F2>", "<Esc>:set paste<cr>i", { silent = true })

-- Search
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Clipboard
vim.opt.clipboard:prepend({ "unnamed", "unnamedplus" })
vim.keymap.set("v", "<C-c>", ":w !clip.exe<cr><cr>", { silent = true })

-- Rename
-- vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>//gI<Left><Left><Left>")

-- Explore
vim.keymap.set("n", "<C-n>", "<cmd>Ex<cr>", { silent = true })

-- Tabs
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Turn off search highlight
vim.keymap.set("n", "<leader><space>", ":nohlsearch<cr>", { silent = true })

-- Folding
vim.keymap.set("n", "<space>", "za")

-- Save
vim.cmd("cnoreabbrev save wa<cr>:mksession! session.vim<cr>:qa<cr>")
vim.cmd("cnoreabbrev ss source session.vim<cr>")

-- Split
vim.keymap.set("n", "<C-w>s", ":split<cr><C-w>j <cmd>Explore .<cr>", { silent = true })
vim.keymap.set("n", "<C-w>v", ":vsplit<cr><C-w>l <cmd>Explore .<cr>", { silent = true })
vim.keymap.set("n", "<C-w>S", ":split ")
vim.keymap.set("n", "<C-w>V", ":vsplit ")
-- Moving to tabs
vim.keymap.set("n", "<C-l>", "<C-w>w")
-- Resizing
vim.keymap.set("n", "<C-left>", ":vertical resize -2<cr>", { silent = true })
vim.keymap.set("n", "<C-right>", ":vertical resize +2<cr>", { silent = true })
vim.keymap.set("n", "<C-up>", ":resize +2<cr>", { silent = true })
vim.keymap.set("n", "<C-down>", ":resize -2<cr>", { silent = true })
-- Window tabs
vim.keymap.set("n", "<C-w>i", ":tabnew ~/.config/nvim<cr>", { silent = true })
vim.keymap.set("n", "<C-w>c", ":tabclose<cr>", { silent = true })
vim.keymap.set("n", "<C-w>t", "<cmd>tabnew<cr><cmd>Veil<cr><cmd>set nocursorline<cr>", { silent = true })
vim.keymap.set("n", "<C-w>T", ":tabnew ")
-- Moving to window tabs
vim.keymap.set("n", "<Tab>", "gt")
vim.keymap.set("n", "<S-Tab>", "gT")

-- Mouse
vim.keymap.set("n", "<leader>mn", ":set mouse=a<cr>:echo ' mouse on'<cr>")
vim.keymap.set("n", "<leader>mf", ":set mouse=<cr>:echo ' mouse off'<cr>")
