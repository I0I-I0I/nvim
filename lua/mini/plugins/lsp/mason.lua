local M = {
	"williamboman/mason.nvim",
	event = "VeryLazy",
}

function M.config()
	require("mason").setup({
		ensure_installed = {
			"stylua",
			"prettierd",
			"black",

			"emmet-language-server",
			"html-lsp",
			"css-lsp",
			"lua-language-server",
		},
	})
end

return M
