autocmd("FileType", {
	pattern = { "html", "templ" },
	callback = function()
		vim.lsp.start({
			capabilities = capabilities,
			cmd = { "vscode-html-language-server", "--stdio" },
			init_options = {
				configurationSection = { "html", "css", "javascript" },
				embeddedLanguages = {
					css = true,
					javascript = true,
				},
				provideFormatter = true,
			},
			root_dir = vim.fn.getcwd(),
			single_file_support = true,
		})
	end,
})
