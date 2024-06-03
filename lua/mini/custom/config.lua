function _G.check_back_space()
	local col = vim.fn.col(".") - 1
	return col == 0 or vim.fn.getline("."):sub(col, col):match("%s") ~= nil
end

-- tabline

vim.cmd("set tabline=%{bufname(winbufnr(0))}")

-- Whitespace removal

autocmd("BufWritePre", {
	callback = function()
		vim.cmd([[ keeppatterns %s/\s\+$//e ]])
	end,
})

-- Smartindent in python, javascript files

vim.cmd([[
	autocmd FileType python set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with
	autocmd FileType javascript set smartindent cinwords=if,else,for,while,function,class
]])

-- Statusline

require(Utils .. "statusline")

autocmd("BufEnter", {
	callback = function()
		vim.opt.statusline = Statusline()
	end,
})
