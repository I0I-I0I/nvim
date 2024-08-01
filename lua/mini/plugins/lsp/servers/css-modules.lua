autocmd("FileType", {
	pattern = {
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
	},
	callback = function()
		vim.lsp.start({
			capabilities = capabilities,
			cmd = { "cssmodules-language-server" },
			filetypes = {
				"javascript",
				"javascriptreact",
				"javascript.jsx",
				"typescript",
				"typescriptreact",
				"typescript.tsx",
			},
			root_dir = vim.fn.getcwd(),
			single_file_support = true,
		})
	end,
})
