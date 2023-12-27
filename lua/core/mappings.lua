vim.g.mapleader = ","

-- Move string
vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv", { silent = true })
vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv", { silent = true })

-- Move screen
-- vim.keymap.set("n", "<C-d>", "<C-d>zz")
-- vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Run
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*.js",
	callback = function()
		vim.keymap.set("n", "<F8>", "<cmd>w<cr><cmd>exec '!node' shellescape(@%, 1)<cr>", { silent = true })
	end,
})

vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*.py",
	callback = function()
		vim.keymap.set("n", "<F8>", "<cmd>w<cr><cmd>exec '!python3.11' shellescape(@%, 1)<cr>", { silent = true })
	end,
})

-- Terminal
vim.keymap.set("n", "<C-\\>", "<cmd>split <cr><C-w>J<cmd>resize 20<cr><cmd>term<cr>i", { silent = true })
vim.keymap.set("t", "<C-\\>", "<cmd>Bdelete!<cr><cmd>close<cr>", { silent = true })

-- $ ^
vim.keymap.set({ "v", "n", "x" }, "H", "^")
vim.keymap.set({ "v", "n", "x" }, "L", "$")

-- Insert Enter
vim.keymap.set("i", "<C-Enter>", "<Esc>o")
vim.keymap.set("i", "<S-Enter>", "<Esc>O")
-- Normal Enter
vim.keymap.set("n", "<C-Enter>", "o<Esc>")
vim.keymap.set("n", "<S-Enter>", "O<Esc>")

-- Insert left, right
vim.keymap.set("i", "<C-h>", "<left>")
vim.keymap.set("i", "<C-l>", "<right>")

-- Save
vim.keymap.set({ "n", "i" }, "<C-s>", "<cmd>w<cr>")

-- Not yank with x/s
vim.keymap.set("v", "x", '"_x')
vim.keymap.set("v", "X", '"_X')

vim.keymap.set({ "n", "v" }, "s", '"_s')
vim.keymap.set({ "n", "v" }, "S", '"_S')

-- Paste
vim.keymap.set("x", "<leader>p", '"_dP')

local index = false
function TogglePast()
	if index == false then
		vim.cmd("set paste")
		index = true
		print("paste on")
	else
		vim.cmd("set nopaste")
		index = false
		print("paste off")
	end
end

vim.api.nvim_create_user_command("TogglePaste", TogglePast, {})
vim.keymap.set({ "n", "i" }, "<F2>", "<cmd>TogglePaste<cr>")

-- Search
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Clipboard
vim.opt.clipboard:prepend({ "unnamed", "unnamedplus" })
vim.keymap.set("v", "<C-c>", ":w !clip.exe<cr>", { silent = true })

-- Rename
vim.keymap.set("n", "<leader>r", ":%s/\\<<C-r><C-w>\\>//gI<Left><Left><Left>")

-- Explore
-- vim.keymap.set("n", "<C-b>", "<cmd>Ex<cr>", { silent = true })

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
vim.keymap.set("n", "<C-w>t", "<cmd>tabnew<cr><cmd>Ex<cr>", { silent = true })
vim.keymap.set("n", "<C-w>T", ":tabnew ")
-- Moving to window tabs
vim.keymap.set("n", "<Tab>", "gt")
vim.keymap.set("n", "<S-Tab>", "gT")

-- Mouse
local mouseMode = "a"
function ToggleMouse()
	if mouseMode == "a" then
		vim.opt.mouse = ""
		mouseMode = ""
		print("mouse off")
	else
		vim.opt.mouse = "a"
		mouseMode = "a"
		print("mouse on")
	end
end
vim.keymap.set("n", "<leader>m", "<cmd>lua ToggleMouse()<cr>")
