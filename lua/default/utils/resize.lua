-- Resize
autocmd("VimResized", {
	group = augroup("WinResize", { clear = true }),
	pattern = "*",
	command = "wincmd =",
})
