local opts = { noremap = true, silent = true }

vim.g.mapleader = ","
vim.g.maplocalleader = " "

-- Movement
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "''", "''zz")
vim.keymap.set("n", "<C-y>", "3<C-y>")
vim.keymap.set("n", "<C-e>", "3<C-e>")

-- Netrw
vim.keymap.set("n", "-", "<cmd>Ex<cr>", { table.insert(opts, {desc = "Toggle netrw"}) })

-- Rename
vim.keymap.set("n", "R", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", { desc = "Replace word" })

-- Turn off search highlight
vim.keymap.set("n", "<localleader><localleader>", "<cmd>nohlsearch<cr>", { table.insert(opts, {desc = "Turn off search highlight"}) })

-- QFix
vim.keymap.set("n", "<C-n>", "<cmd>cnext<cr>", { table.insert(opts, {desc = "Next qfix"}) })
vim.keymap.set("n", "<C-p>", "<cmd>cprevious<cr>", { table.insert(opts, {desc = "Previous qfix"}) })

-- Tmux
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<cr>")
vim.keymap.set("n", "<localleader>rt", "<cmd>silent !tmux-start-job Development 1 npm run test<cr>")
vim.keymap.set("n", "<localleader>rd", "<cmd>silent !tmux-start-job Development 0 npm run dev<cr>")
vim.keymap.set("n", "<localleader>rb", "<cmd>silent !tmux-start-job Development 0 npm run build<cr>")
vim.keymap.set("n", "<localleader>rr", ":silent !tmux-start-job Development 0 ")

-- Move lines
vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv", { silent = true })
vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv", { silent = true })

-- Move tabs
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Don't yank
vim.keymap.set({ "v", "n" }, "x", '"_x')
vim.keymap.set({ "v", "n" }, "X", '"_X')
vim.keymap.set({ "v", "n" }, "s", '"_s')
vim.keymap.set({ "v", "n" }, "S", '"_S')

-- Don't yank on paste
vim.keymap.set("x", "P", '"_dP')
