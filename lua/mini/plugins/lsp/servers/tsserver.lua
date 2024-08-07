return {
	capabilities = vim.g.capabilities,
	settings = {
		experemental = {
			enableProjectDiagnostics = true,
		},
		typescript = {
			inlayHints = {
				includeInlayParameterNameHints = "literal",
				includeInlayFunctionParameterTypeHints = true,
				includeInlayEnumMemberValueHints = true,
				includeInlayFunctionLikeReturnTypeHints = true,
				includeInlayPropertyDeclarationTypeHints = true,
				includeInlayParameterNameHintsWhenArgumentMatchesName = false,
				includeInlayVariableTypeHints = false,
			},
		},
		javascript = {
			inlayHints = {
				includeInlayParameterNameHints = "literal",
				includeInlayFunctionParameterTypeHints = true,
				includeInlayEnumMemberValueHints = true,
				includeInlayFunctionLikeReturnTypeHints = true,
				includeInlayPropertyDeclarationTypeHints = true,
				includeInlayParameterNameHintsWhenArgumentMatchesName = false,
				includeInlayVariableTypeHints = false,
			},
		},
	},
}
