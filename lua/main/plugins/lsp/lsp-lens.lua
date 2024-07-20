local M = {
	"VidocqH/lsp-lens.nvim",
	event = "BufRead",
}

function M.config()
	local SymbolKind = vim.lsp.protocol.SymbolKind

	require("lsp-lens").setup({
		enable = true,
		include_declaration = true,
		sections = {
			definition = true,
			references = true,
			implements = true,
			git_authors = true,
		},
		ignore_filetype = {
			"prisma",
		},
		target_symbol_kinds = { SymbolKind.Function, SymbolKind.Method, SymbolKind.Interface },
		wrapper_symbol_kinds = { SymbolKind.Class, SymbolKind.Struct },
	})
end

return M
