vim.g.mapleader = ","

-- Move string
vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv", { silent = true })
vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv", { silent = true })

-- Move screen
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Not yank with 'x'
vim.keymap.set("v", "x", '"_x')

-- Search
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Clipboard
vim.opt.clipboard:prepend({ "unnamed", "unnamedplus" })
vim.keymap.set("v", "<C-c>", ":w !clip.exe<cr><cr>", { silent = true })

-- Paste
vim.keymap.set("x", "<leader>p", '"_dP')
vim.keymap.set("n", "<F2>", ":set paste<cr>", { silent = true })
vim.keymap.set("n", "<F3>", ":set nopaste<cr>", { silent = true })
vim.keymap.set("i", "<F2>", "<Esc>:set paste<cr>i", { silent = true })

-- Change
vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>//gI<Left><Left><Left>")

-- Tabs
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Turn off search highlight
vim.keymap.set("n", "<leader><space>", ":nohlsearch<cr>", { silent = true })

-- Folding
vim.keymap.set("n", "<space>", "za")
vim.keymap.set("n", "C-<space>", "zf")

-- Save
vim.cmd("cnoreabbrev save wa<cr>:mksession! session.vim<cr>:qa<cr>")
vim.cmd("cnoreabbrev ss source session.vim<cr>")

-- Split
vim.keymap.set("n", "<C-w>s", ":split<cr><C-w>j:Neotree float toggle<cr>", { silent = true })
vim.keymap.set("n", "<C-w>v", ":vsplit<cr><C-w>l:Neotree float toggle<cr>", { silent = true })
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
vim.keymap.set("n", "<C-w>t", ":tabnew<cr>:Veil<cr>", { silent = true })
vim.keymap.set("n", "<C-w>T", ":tabnew ")
-- Moving to window tabs
vim.keymap.set("n", "<Tab>", "gt")
vim.keymap.set("n", "<S-Tab>", "gT")

-- Mouse
vim.keymap.set("n", "<leader>mn", ":set mouse=a<cr>:echo ' mouse on'<cr>")
vim.keymap.set("n", "<leader>mf", ":set mouse=<cr>:echo ' mouse off'<cr>")

-- Emmet
vim.keymap.set({ "n", "v" }, "<leader>w", require("nvim-emmet").wrap_with_abbreviation)
