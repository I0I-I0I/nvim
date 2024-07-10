-- Move string
vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv", { silent = true })
vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv", { silent = true })

-- leave from insert mode
vim.keymap.set("i", "jk", "<Esc>")

-- Buffers
vim.keymap.set("n", "gn", "<cmd>bnext<cr>", { silent = true, noremap = false })
vim.keymap.set("n", "gp", "<cmd>bprevious<cr>", { silent = true, noremap = false })
vim.keymap.set("n", "gw", "<cmd>bdelete<cr>", { silent = true, noremap = false })

-- norm in visual
vim.keymap.set("v", "n", ":norm ")

-- Macros
vim.keymap.set("n", "Q", ":norm @aj<cr>", { silent = true, noremap = true })
vim.keymap.set("x", "Q", ":norm @a<cr>", { silent = true, noremap = true })

-- Insert Enter
vim.keymap.set("i", "<C-b>", "<cmd>norm dwa<cr>", { silent = true, noremap = true })
vim.keymap.set("i", "<C-/>", "<cmd>norm gcc<cr>", { silent = true, noremap = true })

vim.keymap.set("i", "<C-j>", "<cmd>norm o<cr>", { silent = true, noremap = true })
vim.keymap.set("i", "<C-k>", "<cmd>norm O<cr>", { silent = true, noremap = true })

vim.keymap.set({ "i", "c" }, "<C-h>", "<C-Left>", { noremap = true })
vim.keymap.set({ "i", "c" }, "<C-l>", "<C-Right>", { noremap = true })
vim.keymap.set({ "i", "c" }, "<A-h>", "<left>", { noremap = true })
vim.keymap.set({ "i", "c" }, "<A-l>", "<right>", { noremap = true })
vim.keymap.set({ "i", "c" }, "<A-k>", "<up>", { noremap = true })
vim.keymap.set({ "i", "c" }, "<A-j>", "<down>", { noremap = true })

-- Paste
vim.keymap.set("x", "p", '"_dP')
vim.keymap.set("x", "P", '""p')

vim.keymap.set({ "v", "n" }, "<space>", '"')

-- Not yank with x/s
vim.keymap.set("v", "x", '"_x')
vim.keymap.set("v", "X", '"_X')
vim.keymap.set("v", "s", '"_s')
vim.keymap.set("v", "S", '"_S')

-- Save
vim.keymap.set({ "v", "n", "i" }, "<C-s>", "<cmd>w<cr><Esc>")

-- Rename
vim.keymap.set("n", "R", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

-- Tabs
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Turn off search highlight
vim.keymap.set("n", "<space><space>", "<cmd>nohlsearch<cr>", { silent = true })

-- Wrap

vim.keymap.set("n", "<F2>", function()
	vim.opt.wrap = not vim.opt.wrap._value
end)

-- Split
vim.keymap.set("n", "<C-w>s", "<cmd>split<cr><C-w>j", { silent = true })
vim.keymap.set("n", "<C-w>v", "<cmd>vsplit<cr><C-w>l", { silent = true })
vim.keymap.set("n", "<C-w>S", ":split ")
vim.keymap.set("n", "<C-w>V", ":vsplit ")

-- Resizing
vim.keymap.set("n", "<C-left>", "<cmd>vertical resize -2<cr>", { silent = true })
vim.keymap.set("n", "<C-right>", "<cmd>vertical resize +2<cr>", { silent = true })
vim.keymap.set("n", "<C-up>", "<cmd>resize +2<cr>", { silent = true })
vim.keymap.set("n", "<C-down>", "<cmd>resize -2<cr>", { silent = true })
vim.keymap.set("n", "<C-w>m", "<C-w>|<C-w>_", { silent = true })

-- Run
autocmd("BufRead", {
	pattern = "*.js",
	callback = function()
		vim.keymap.set("n", "<leader>R", "<cmd>w<cr><cmd>exec '!node' shellescape(@%, 1)<cr>", { silent = true })
	end,
})

autocmd("BufRead", {
	pattern = "*.py",
	callback = function()
		vim.keymap.set("n", "<leader>R", "<cmd>w<cr><cmd>exec '!python3.11' shellescape(@%, 1)<cr>", { silent = true })
	end,
})
