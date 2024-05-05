local function pylsp()
	lspconfig.pylsp.setup({
		capabilities = capabilities,
		filetypes = { "python" },
		language_server = "pylsp",
		source_strategies = { "poetry", "default", "system" },
		handlers = {
			source_definition = function(err, locations) end,
			file_references = function(err, locations) end,
			code_action = function(err, actions) end,
		},
	})
end

return pylsp
