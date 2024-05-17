local function cssModules()
	lspconfig.cssmodules_ls.setup({
		filetypes = {
			"typescriptreact",
			"javascriptreact",
		},
		capabilities = capabilities,
		init_options = {
			camelCase = "dashes",
		},
	})
end

return cssModules
