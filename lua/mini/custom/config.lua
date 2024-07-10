function _G.check_back_space()
	local col = vim.fn.col(".") - 1
	return col == 0 or vim.fn.getline("."):sub(col, col):match("%s") ~= nil
end

-- tabline

-- vim.opt.showtabline = 2

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

vim.api.nvim_create_user_command("Term", function()
	-- vim.keymap.set("t", "<Esc>", "<C-\\><C-N>", { silent = true })
	vim.opt.number = false
	vim.opt.relativenumber = false
	vim.opt.signcolumn = "no"
	vim.opt.showmode = false
	vim.opt.showcmd = false
	vim.opt.ruler = false
	vim.opt.laststatus = 0
	vim.opt.cmdheight = 0
	vim.opt.spell = false
	vim.cmd("set mouse=")
	vim.cmd("SetColor default 0")
	vim.cmd("terminal")
end, {})
