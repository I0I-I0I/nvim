local function cssls()
	lspconfig.cssls.setup({
		filetypes = { "css" },
		capabilities = capabilities,
	})
end

return cssls
