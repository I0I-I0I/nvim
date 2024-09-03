return {
	capabilities = vim.g.capabilities,
	settings = {
		Lua = {
			hint = { enable = true },
			runtime = { version = "LuaJIT" },
			workspace = {
				checkThirdParty = false,
				library = { vim.env.VIMRUNTIME },
			},
			complition = {
				callSnippet = "Replace",
			},
			telemetry = { enable = false },
			diagnostics = {
				globals = {
					"vim",
					"augroup",
					"autocmd",
					"capabilities",
					"sources",
				},
			},
		},
	},
	single_file_support = true,
}
