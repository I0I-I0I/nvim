vim.loader.enable()

-- Settings
vim.g.mapleader = ","
vim.opt.termguicolors = true
vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"

-- WSL yank support
vim.cmd([[
    let s:clip = '/mnt/c/Windows/System32/clip.exe'
    if executable(s:clip)
        augroup WSLYank
            autocmd!
            autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
        augroup END
    endif
]])

vim.cmd([[
	cnoreabbrev W w
	cnoreabbrev W! w!
	cnoreabbrev Q q
	cnoreabbrev Q! q!
    cnoreabbrev Wq wq
	cnoreabbrev Wa wa
	cnoreabbrev Qa qa
]])

vim.cmd([[
    cnoreabbrev drevo /mnt/d/code/project/site_revo/app/
    cnoreabbrev dtravel /mnt/d/code/project/site_travel/app/
]])

-- Cursor line
vim.cmd("set cursorlineopt=line")

vim.api.nvim_create_autocmd("InsertEnter", {
	command = "set nocursorline",
})

vim.api.nvim_create_autocmd("InsertLeave", {
	command = "set cursorline",
})

vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*.*",
	command = "set cursorline",
})

-- Source
function Source()
	vim.cmd("w | source")
end

vim.api.nvim_create_user_command("Source", Source, {})
vim.cmd("ab so Source")

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

vim.api.nvim_create_autocmd("BufWritePre", {
	callback = function()
		vim.cmd([[ keeppatterns %s/\s\+$//e ]])
	end,
})

vim.cmd([[
	autocmd FileType python set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with
	autocmd FileType javascript set smartindent cinwords=if,else,for,while,function,class
]])

--
vim.opt.autoread = true
vim.bo.autoread = true

-- Tabs
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.showtabline = 1

vim.cmd([[
	set shiftwidth=4
	set expandtab
	set tabstop=4
	set softtabstop=0
]])

-- Color column
vim.opt.colorcolumn = "80"

-- word separators
vim.cmd("set iskeyword+=!,^34,^_")

-- Format options
vim.g.formatoptions = "qrn1"

-- Update time
vim.opt.updatetime = 300

-- Display invisible characters
vim.opt.list = false

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
vim.opt.number = true
vim.opt.relativenumber = true

-- Scroll
vim.opt.scrolloff = 7

-- Search
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Showmode
vim.opt.showmode = false

-- Autocomplite
vim.cmd("filetype plugin on")
vim.api.nvim_create_autocmd("FileType", {
	pattern = "javascript",
	callback = function()
		vim.cmd("set omnifunc=javascriptcomplete#CompleteJS")
		print("JavaScript")
	end,
})

-- Mouse
vim.opt.mousefocus = true
vim.opt.mouse = "a"

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

function statusline()
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
