local function Stylelint()
	lspconfig.stylelint_lsp.setup({
		capabilities = capabilities,
		handlers = {
			source_definition = function(err, locations) end,
			file_references = function(err, locations) end,
			code_action = function(err, actions) end,
		},
	})
end

return Stylelint
