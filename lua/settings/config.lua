vim.loader.enable()

autocmd = vim.api.nvim_create_autocmd
augroup = vim.api.nvim_create_augroup

-- Settings
vim.opt.termguicolors = true
vim.opt.fillchars = "eob:\\u00A0,vert:\\u00A0"

-- Undo
vim.opt.undodir = "/mnt/d/undo"
vim.opt.undofile = true
vim.opt.undolevels = 10000000
vim.opt.undoreload = 10000000

-- Disable swapfile
vim.opt.swapfile = false

-- Spell
vim.opt.spelllang = "en_us"
vim.opt.spell = true

-- Explorer
vim.g.netrw_banner = 0
vim.g.netrw_list_hide = "node_modules/,^\\.\\=/\\=$,^\\.\\.\\=/\\=$"

-- Tabs
vim.opt.smartindent = true
vim.opt.expandtab = false -- false == tabs
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

-- Completeion
vim.opt.completeopt = { "menu", "menuone", "fuzzy", "noselect" }

-- Display invisible characters
vim.opt.list = true
vim.opt.listchars = { tab = "┆ ", trail = "·", leadmultispace = "·", nbsp = "␣" }
vim.cmd.hi("Whitespace guifg=#333333")

-- Wrap
vim.opt.linebreak = true

-- Numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Search
vim.opt.smartcase = true

-- Mouse
vim.opt.mouse = "a"

-- Status line
vim.opt.laststatus = 3

-- Signcolumn
vim.opt.signcolumn = "yes"
