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
		expose_as_code_action = {},
		tsserver_path = nil,
		tsserver_plugins = {},
		tsserver_max_memory = "auto",
		tsserver_format_options = {},
		tsserver_file_preferences = {},
		tsserver_locale = "en",
		complete_function_calls = true,
		include_completions_with_insert_text = true,
		code_lens = nil,
		disable_member_code_lens = false,
	},
})
