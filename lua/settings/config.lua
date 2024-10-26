vim.loader.enable()

autocmd = vim.api.nvim_create_autocmd
augroup = vim.api.nvim_create_augroup

-- Settings
vim.opt.termguicolors = true
vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fillchars = "eob:\\u00A0,vert:\\u00A0"

-- Undo
vim.opt.undodir = "/mnt/d/undo"
vim.opt.undofile = true
vim.opt.undolevels = 1000000
vim.opt.undoreload = 1000000

-- Disable swapfile/backup
vim.opt.swapfile = false
vim.opt.backup = false

-- Spell
vim.opt.spelllang = "en_us"
vim.opt.spell = true

-- Explorer
vim.g.netrw_banner = 0
vim.g.netrw_browse_split = 0
vim.g.netrw_list_hide = "node_modules/,^\\.\\=/\\=$,^\\.\\.\\=/\\=$"

-- Tabs
vim.opt.smartindent = true
vim.opt.expandtab = false -- false == tabs
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

-- Color column
vim.opt.colorcolumn = "80"

-- Completeion
vim.opt.completeopt = { "menu", "menuone", "fuzzy" }

-- Display invisible characters
vim.opt.list = true
vim.opt.listchars = { tab = "┆ ", trail = "·", leadmultispace = "·", nbsp = "␣" }
vim.cmd.hi("Whitespace guifg=#333333")

-- Wrap
vim.opt.linebreak = true

-- Shell
vim.opt.shell = "/usr/local/bin/fish"

-- Numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 1

-- Scroll
vim.opt.scrolloff = 3

-- Search
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.smartcase = true

-- Cursor
vim.opt.guicursor = "i:blinkwait700-blinkoff400-blinkon250,r-cr:hor20,o:hor50"

-- Mouse
vim.opt.mousefocus = true
vim.opt.mouse = "a"

-- Status line
vim.opt.laststatus = 3

-- Signcolumn
vim.opt.signcolumn = "yes"
