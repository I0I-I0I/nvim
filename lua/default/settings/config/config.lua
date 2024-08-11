vim.loader.enable()

-- Settings
vim.opt.termguicolors = true
vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fillchars = "eob:\\u00A0"

vim.cmd([[
	cnoreabbrev W w
	cnoreabbrev W! w!
	cnoreabbrev Q q
	cnoreabbrev Q! q!
    cnoreabbrev Wq wq
	cnoreabbrev Wa wa
	cnoreabbrev Qa qa

    cnoreabbrev n norm
]])

-- Undo
-- vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undodir = "/mnt/d/undo"
vim.opt.undofile = true

-- Spell
vim.opt.spelllang = "en_us"
vim.opt.spell = true

-- swapfile/backup
vim.opt.swapfile = false
vim.opt.backup = false

-- Disable auto comments
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*.*",
	callback = function()
		vim.cmd("set formatoptions-=cro")
	end,
})

-- Explorer
vim.g.netrw_banner = 0
vim.g.netrw_browse_split = 0
vim.g.netrw_winsize = 20
vim.g.netrw_list_hide = "node_modules/,^\\.\\=/\\=$"

vim.opt.autoread = true
vim.bo.autoread = true

-- Tabs
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.showtabline = 1
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 0

-- Color column
vim.opt.colorcolumn = "80"

-- Completeion
vim.opt.completeopt = { "menu", "menuone", "noselect" }

-- word separators
vim.cmd("set iskeyword+=!,^34,^_")

-- Format options
vim.g.formatoptions = "qrn1"

-- Update time
vim.opt.updatetime = 50

-- Display invisible characters
vim.opt.list = true
vim.opt.listchars = { tab = "┆ ", trail = "·", nbsp = "␣" }
vim.cmd.hi("Whitespace guifg=#333333")

-- Wrap
vim.opt.linebreak = true
autocmd("VimEnter", { command = "set wrap" })

-- Shell
vim.opt.shell = "/bin/zsh"

vim.opt.hidden = true

vim.opt.visualbell.t_vb = false

-- Numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 1

-- Scroll
vim.opt.scrolloff = 3

-- Search
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Showmode
vim.opt.showmode = false

-- Mouse
vim.opt.mousefocus = true
vim.opt.mouse = "a"

-- Folding
vim.opt.foldmethod = "manual"
vim.opt.foldcolumn = "0"
vim.opt.foldlevel = 99

vim.opt.laststatus = 3
vim.opt.cmdheight = 0

-- Signcolumn
vim.opt.signcolumn = "yes"

autocmd("FileType", {
	pattern = { "json", "jsons" },
	callback = function()
		vim.wo.spell = false
		vim.wo.conceallevel = 0
	end,
})

autocmd({ "BufWritePre" }, {
	pattern = "*.*",
	command = [[%s/\s\+$//e]],
})
