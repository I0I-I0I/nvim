require("typescript-tools").setup({
	filetypes = {
		"typescript",
		"javascript",
		"typescriptreact",
		"javascriptreact",
	},

	settings = {
		separate_diagnostic_server = true,
		publish_diagnostic_on = "insert_leave",
		expose_as_code_action = "all",
		tsserver_path = nil,
		tsserver_plugins = {},
		tsserver_max_memory = "auto",
		tsserver_locale = "en",
		complete_function_calls = true,
		include_completions_with_insert_text = true,
		code_lens = "off",
		disable_member_code_lens = true,

		tsserver_file_preferences = {
			includeInlayParameterNameHints = "all",
			includeCompletionsForModuleExports = true,
			quotePreference = "double",
		},

		tsserver_format_options = {
			allowIncompleteCompletions = true,
			allowRenameOfImportPath = true,
		},
	},
})

Bind({
	["n"] = {
		["<plugleader>lR"] = { "<cmd>TSToolsRenameFile<cr>", { silent = true, noremap = true }, desc = "Rename File" },
	},
})
