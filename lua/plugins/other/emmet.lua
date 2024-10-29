local M = { "mattn/emmet-vim" }

autocmd("FileType", {
	pattern = {
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
		"html",
		"css",
		"sass",
		"scss",
	},
	callback = function()
		vim.cmd.EmmetInstall()
		vim.keymap.set({ "n", "v", "i" }, "<A-m>", "<cmd>norm <M-q>,<cr>", { noremap = true })
	end,
})

vim.g.user_emmet_mode = "a"
vim.g.user_emmet_leader_key = "<M-q>"
vim.g.user_emmet_install_global = 0

return M
