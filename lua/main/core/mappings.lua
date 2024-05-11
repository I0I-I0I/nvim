-- Move string
vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv", { silent = true })
vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv", { silent = true })

-- Quick fix list
vim.keymap.set("n", "<C-n>", "<cmd>cnext<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<C-p>", "<cmd>cprevious<cr>", { silent = true, noremap = true })

-- $ ^
vim.keymap.set({ "v", "n", "x" }, "H", "^")
vim.keymap.set({ "n", "x", "v" }, "L", "g_")

-- leave from insert mode
vim.keymap.set("i", "jk", "<Esc>")

-- Insert Enter
vim.keymap.set("i", "<C-j>", "<cmd>norm o<cr>", { silent = true, noremap = true })
vim.keymap.set("i", "<C-k>", "<cmd>norm O<cr>", { silent = true, noremap = true })

vim.keymap.set("i", "<A-h>", "<left>")
vim.keymap.set("i", "<A-l>", "<right>")
vim.keymap.set("i", "<A-k>", "<up>")
vim.keymap.set("i", "<A-j>", "<down>")

vim.keymap.set("i", "<C-l>", "<cmd>norm w<cr>", { silent = true, noremap = true })
vim.keymap.set("i", "<C-h>", "<cmd>norm b<cr>", { silent = true, noremap = true })

-- yank and paste
vim.keymap.set("v", "1y", '"zy', { noremap = true })
vim.keymap.set("v", "2y", '"xy', { noremap = true })
vim.keymap.set("v", "3y", '"cy', { noremap = true })
vim.keymap.set("v", "4y", '"vy', { noremap = true })
vim.keymap.set("v", "5y", '"by', { noremap = true })

vim.keymap.set("n", "1yy", '"zyy', { noremap = true })
vim.keymap.set("n", "2yy", '"xyy', { noremap = true })
vim.keymap.set("n", "3yy", '"cyy', { noremap = true })
vim.keymap.set("n", "4yy", '"vyy', { noremap = true })
vim.keymap.set("n", "5yy", '"byy', { noremap = true })

vim.keymap.set({ "v", "n" }, "1p", '"zp', { noremap = true })
vim.keymap.set({ "v", "n" }, "2p", '"xp', { noremap = true })
vim.keymap.set({ "v", "n" }, "3p", '"cp', { noremap = true })
vim.keymap.set({ "v", "n" }, "4p", '"vp', { noremap = true })
vim.keymap.set({ "v", "n" }, "5p", '"bp', { noremap = true })

-- Paste
vim.keymap.set("x", "p", '"_dP')
vim.keymap.set("x", "<leader>p", '""p')

-- Not yank with x/s
vim.keymap.set("v", "x", '"_x')
vim.keymap.set({ "v", "n" }, "X", '"_X')

vim.keymap.set({ "n", "v" }, "s", '"_s')
vim.keymap.set({ "n", "v" }, "S", '"_S')

-- Save
vim.keymap.set({ "v", "n", "i" }, "<C-s>", "<cmd>w<cr><Esc>")

-- Rename
vim.keymap.set("n", "<leader>r", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

-- Explore
vim.keymap.set("n", "<C-b>", "<cmd>Ex<cr>", { silent = true })

-- Tabs
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Turn off search highlight
vim.keymap.set("n", "<leader><space>", "<cmd>nohlsearch<cr>", { silent = true })

-- Folding
vim.keymap.set("n", "<space>", "za")

-- Save
vim.cmd("cnoreabbrev save wa<cr><cmd>mksession! session.vim<cr><cmd>qa<cr>")
vim.cmd("cnoreabbrev ss source session.vim<cr>")

-- Split
vim.keymap.set("n", "<C-w>s", "<cmd>split<cr><C-w>j <cmd>Explore .<cr>", { silent = true })
vim.keymap.set("n", "<C-w>v", "<cmd>vsplit<cr><C-w>l <cmd>Explore .<cr>", { silent = true })
vim.keymap.set("n", "<C-w>S", "<cmd>split ")
vim.keymap.set("n", "<C-w>V", "<cmd>vsplit ")
-- Moving to tabs
vim.keymap.set("n", "<C-l>", "<C-w>w")
-- Resizing
vim.keymap.set("n", "<C-left>", "<cmd>vertical resize -2<cr>", { silent = true })
vim.keymap.set("n", "<C-right>", "<cmd>vertical resize +2<cr>", { silent = true })
vim.keymap.set("n", "<C-up>", "<cmd>resize +2<cr>", { silent = true })
vim.keymap.set("n", "<C-down>", "<cmd>resize -2<cr>", { silent = true })
-- Window tabs
vim.keymap.set("n", "<C-w>i", "<cmd>tabnew ~/.config/nvim<cr>", { silent = true })
vim.keymap.set("n", "<C-w>c", "<cmd>tabclose<cr>", { silent = true })
vim.keymap.set("n", "<C-w>t", "<cmd>tabnew<cr><cmd>Ex<cr>", { silent = true })
vim.keymap.set("n", "<C-w>T", "<cmd>tabnew ")
-- Moving to window tabs
vim.keymap.set("n", "<Tab>", "gt")
vim.keymap.set("n", "<S-Tab>", "gT")

-- Run
autocmd("BufRead", {
	pattern = "*.js",
	callback = function()
		vim.keymap.set("n", "<F8>", "<cmd>w<cr><cmd>exec '!node' shellescape(@%, 1)<cr>", { silent = true })
	end,
})

autocmd("BufRead", {
	pattern = "*.py",
	callback = function()
		vim.keymap.set("n", "<F8>", "<cmd>w<cr><cmd>exec '!python3.11' shellescape(@%, 1)<cr>", { silent = true })
	end,
})
