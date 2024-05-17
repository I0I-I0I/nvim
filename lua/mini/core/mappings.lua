-- Move string
vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv", { silent = true })
vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv", { silent = true })

-- Buffers
vim.keymap.set("n", "<C-j>", "<cmd>bnext<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<C-k>", "<cmd>bprevious<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>q", "<cmd>bdelete<cr>", { silent = true, noremap = true })

-- Quick fix list
vim.keymap.set("n", "<C-n>", "<cmd>cnext<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<C-p>", "<cmd>cprevious<cr>", { silent = true, noremap = true })

-- Scroll
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Terminal
vim.keymap.set("n", "<C-\\>", "<cmd>split <cr><C-w>J<cmd>resize 20<cr><cmd>term<cr>i", { silent = true })
vim.keymap.set("t", "<C-\\>", "<cmd>close<cr>", { silent = true })

-- leave from insert mode
vim.keymap.set("i", "jk", "<Esc>")

-- $ ^
vim.keymap.set({ "v", "n", "x" }, "H", "^")
vim.keymap.set({ "n", "x", "v" }, "L", "g_")

-- In insert
vim.keymap.set("i", "<C-w>", "<cmd>norm dwa<cr>", { noremap = true })
vim.keymap.set("i", "<C-b>", "<cmd>norm dba<cr>", { noremap = true })
vim.keymap.set("i", "<C-d>", "<cmd>norm X<cr>", { noremap = true })
vim.keymap.set("i", "<C-c>", "<cmd>norm cc<cr>", { noremap = true })
vim.keymap.set("i", "<C-u>", "<cmd>norm u<cr>", { noremap = true })
vim.keymap.set("i", "<C-r>", "<cmd>norm <C-r><cr>", { noremap = true })

vim.keymap.set("i", "<C-l>", "<cmd>norm w<cr>", { noremap = true })
vim.keymap.set("i", "<C-h>", "<cmd>norm b<cr>", { noremap = true })
vim.keymap.set("i", "<C-j>", "<cmd>norm o<cr>", { noremap = true })
vim.keymap.set("i", "<C-k>", "<cmd>norm O<cr>", { noremap = true })

vim.keymap.set("i", "<A-h>", "<left>", { noremap = true })
vim.keymap.set("i", "<A-l>", "<right>", { noremap = true })
vim.keymap.set("i", "<A-k>", "<up>", { noremap = true })
vim.keymap.set("i", "<A-j>", "<down>", { noremap = true })

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
vim.keymap.set({ "n", "v" }, "<leader>r", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

-- Explore
vim.keymap.set("n", "<C-b>", "<cmd>Ex<cr>", { silent = true })

-- Tabs
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Search
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Turn off search highlight
vim.keymap.set("n", "<leader><space>", "<cmd>nohlsearch<cr>", { silent = true })

-- Wrap
vim.keymap.set("n", "<leader>w", function()
	vim.opt.wrap = not vim.opt.wrap._value
end)

-- Save
vim.cmd("cnoreabbrev save wa<cr><cmd>mksession! session.vim<cr><cmd>qa<cr>")
vim.cmd("cnoreabbrev ss source session.vim<cr>")

-- Splits
vim.keymap.set("n", "<C-w>s", "<cmd>split<cr><C-w>j <cmd>Explore .<cr>", { silent = true })
vim.keymap.set("n", "<C-w>v", "<cmd>vsplit<cr><C-w>l <cmd>Explore .<cr>", { silent = true })
vim.keymap.set("n", "<C-w>S", ":split ")
vim.keymap.set("n", "<C-w>V", ":vsplit ")
-- Moving to tabs
vim.keymap.set("n", "<C-l>", "<C-w>w")
-- Resizing
vim.keymap.set("n", "<C-left>", "<cmd>vertical resize -2<cr>", { silent = true })
vim.keymap.set("n", "<C-right>", "<cmd>vertical resize +2<cr>", { silent = true })
vim.keymap.set("n", "<C-up>", "<cmd>resize +2<cr>", { silent = true })
vim.keymap.set("n", "<C-down>", "<cmd>resize -2<cr>", { silent = true })
-- Window tabs
vim.keymap.set("n", "<C-w>i", "<cmd>tabnew ~/.config/nvim-min<cr>", { silent = true })
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
