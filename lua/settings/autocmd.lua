-- Disable auto comments
autocmd({ "VimEnter", "BufEnter" }, {
	pattern = "*",
	callback = function()
		vim.cmd("set formatoptions=jcrql")
	end,
})

-- Remove trailing spaces
autocmd({ "BufWritePre" }, {
	pattern = "*.*",
	command = [[%s/\s\+$//e]],
})

-- Yank
autocmd("TextYankPost", {
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 100,
		})
	end,
})

-- Resize
autocmd("VimResized", {
	group = augroup("WinResize", { clear = true }),
	pattern = "*",
	command = "wincmd =",
})
