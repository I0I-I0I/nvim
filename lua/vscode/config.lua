-- Basic
vim.g.mapleader = ","
vim.opt.termguicolors = true
vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"

vim.cmd([[
	cnoreabbrev W w
	cnoreabbrev W! w!
	cnoreabbrev Q q
	cnoreabbrev Q! q!
    cnoreabbrev Wq wq
	cnoreabbrev Wa wa
	cnoreabbrev Qa qa
]])

-- Swap
vim.opt.swapfile = false
vim.cmd("set noswapfile")

-- Color column
vim.opt.colorcolumn = "80"

-- word separators
vim.cmd("set iskeyword+=!,^34,^_")

-- Shell
vim.opt.shell = "/bin/zsh"

vim.opt.hidden = true

-- Scroll
vim.opt.scrolloff = 7

-- Folding
vim.opt.foldmethod = "indent"
vim.opt.foldcolumn = "0"
vim.opt.foldlevel = 999
