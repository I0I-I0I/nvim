vim.loader.enable()
-- Settings
vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

vim.cmd([[
	cnoreabbrev W w
]])

-- Cursor line
vim.cmd("set cursorlineopt=line")
vim.api.nvim_create_autocmd("InsertEnter", {
	command = "set nocursorline",
})
vim.api.nvim_create_autocmd("InsertLeave", {
	command = "set cursorline",
})
vim.api.nvim_create_autocmd("TermEnter", {
	command = "set nocursorline",
})

-- Spell
vim.opt.spelllang = "en_us"
vim.opt.spell = true

-- Swap
vim.opt.swapfile = false
vim.cmd("set noswapfile")

-- Explorer
vim.cmd("let g:netrw_banner = 0")
vim.cmd("let g:netrw_liststyle = 3")
vim.cmd("let g:netrw_browse_split = 0")
vim.cmd("let g:netrw_winsize = 20")

-- Colors
vim.cmd("set termguicolors")

-- Tabs
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.cindent = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.showtabline = 1

-- Use tabs
vim.api.nvim_create_autocmd("InsertEnter", {
	pattern = { "*.*" },
	command = "set noexpandtab",
})

-- Color column
vim.opt.colorcolumn = "80"

-- word separators
vim.cmd("set iskeyword+=!,^34,^_")

-- Format options
vim.g.formatoptions = "qrn1"

-- Updatetime
vim.opt.updatetime = 100

-- Display invisible characters
vim.opt.list = true

-- Wrap
vim.opt.linebreak = true
vim.wo.linebreak = true
vim.api.nvim_create_autocmd("BufEnter", {
	command = "set wrap",
})
-- Shell
vim.opt.shell = "/bin/zsh"

vim.opt.hidden = true

vim.opt.visualbell.t_vb = false

-- Numbers
vim.opt.ruler = true
vim.opt.number = true
vim.opt.relativenumber = true

-- Scroll
vim.opt.scrolloff = 7

-- Search
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Mouse
vim.opt.mousefocus = true
vim.opt.mouse = "a"

-- Showmode
-- vim.opt.showmode = false

-- Autocomplite
vim.cmd("filetype plugin on")
vim.api.nvim_create_autocmd("InsertEnter", {
	pattern = { "*.js" },
	command = "set omnifunc=javascriptcomplete#CompleteJS",
})

-- Paste
vim.api.nvim_create_autocmd("InsertLeave", {
	pattern = "*",
	command = "set nopaste",
})

-- Folding
vim.opt.foldmethod = "indent"
vim.opt.foldcolumn = "0"
vim.opt.foldlevel = 999

vim.opt.laststatus = 0

local function git_branch()
	local branch = vim.fn.system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
	if string.len(branch) > 0 then
		return branch
	else
		return ":"
	end
end

local function statusline()
	local set_color_1 = "%#PmenuSel#"
	local branch = git_branch()
	local set_color_2 = "%#LineNr#"
	local space = " "
	local file_name = " %t"
	local modified = "%m"
	local paste = " %{&paste?'[paste] ':''}"
	local align_right = "%="
	local fileencoding = " %{&fileencoding?&fileencoding:&encoding}"
	local fileformat = " [%{&fileformat}]"
	local linecol = " %l:%c "
	local filetype = " %y"

	return string.format(
		"%s %s %s%s%s%s%s%s%s",
		set_color_2,
		branch,
		set_color_2,
		file_name,
		filetype,
		modified,
		paste,
		align_right,
		linecol
	)
end

vim.opt.statusline = statusline()
