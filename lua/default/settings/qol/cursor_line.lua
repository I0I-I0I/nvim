if not vim.g.neovide then
	return
end

-- Cursor line
vim.cmd("set cursorlineopt=line")
vim.cmd("hi! CursorLine guibg=#333333")

autocmd("InsertEnter", {
	command = "set nocursorline",
})

autocmd("InsertLeave", {
	pattern = "*.*",
	callback = function()
		if vim.bo.filetype ~= "veil" then
			vim.cmd("set cursorline")
		end
	end,
})

autocmd("BufEnter", {
	pattern = "*.*",
	callback = function()
		if vim.bo.filetype ~= "veil" then
			vim.cmd("set cursorline")
		end
	end,
})

vim.cmd("hi NvimTreeCursorLine guibg=#333333")

-- vim.cmd("hi! CursorLine gui=underline cterm=underline guibg=NONE ctermfg=None guifg=None")
