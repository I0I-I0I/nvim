-- Cursor line
vim.cmd("set cursorlineopt=line")

autocmd("InsertEnter", {
	command = "set nocursorline",
})

autocmd("InsertLeave", {
	command = "set cursorline",
})

autocmd("BufEnter", {
	pattern = "*.*",
	command = "set cursorline",
})
