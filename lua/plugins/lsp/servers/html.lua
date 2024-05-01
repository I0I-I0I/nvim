local function html()
	lspconfig.html.setup({
		capabilities = capabilities,
		filetypes = { "html" },
	})
end

return html
