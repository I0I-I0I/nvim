require("mason").setup({
	ensure_installed = {
		"stylua",
		"eslint_d",
		"prettierd",
		"htmlhint",
		"pylint",
		"black",

		"css-lsp",
		"css-variables-language-server",
		"cssmodules-language-server",
		"emmet-language-server",
		"html-lsp",
		"lua-language-server",
		"python-lsp-server",
		"stylelint-lsp",
	},
})
