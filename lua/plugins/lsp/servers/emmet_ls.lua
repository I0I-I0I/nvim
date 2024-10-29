return {
	capabilities = vim.g.capabilities,
	filetypes = { "html", "css", "scss", "javascript", "javascriptreact", "typescript", "typescriptreact" },
	init_options = {
		html = {
			options = {
				["bem.enabled"] = true,
			},
		},
	},
}
