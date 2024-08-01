autocmd("FileType", {
	pattern = { "css", "scss" },
	callback = function()
		vim.lsp.start({
			capabilities = capabilities,
			cmd = { "vscode-css-language-server", "--stdio" },
			init_options = {
				provideFormatter = true,
			},
			settings = {
				css = {
					validate = true,
				},
				scss = {
					validate = true,
				},
			},
			root_dir = vim.fn.getcwd(),
			single_file_support = true,
		})
	end,
})
