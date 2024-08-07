-- Vertical help
autocmd("FileType", {
	group = augroup("VerticalHelp", { clear = true }),
	pattern = "help",
	callback = function()
		vim.bo.bufhidden = "unload"
		vim.cmd.wincmd("L")
		vim.cmd.wincmd("=")
	end,
})
