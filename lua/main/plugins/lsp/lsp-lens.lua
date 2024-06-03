local Lens = {
	"VidocqH/lsp-lens.nvim",
	event = "BufRead",
}

function Lens.config()
	local SymbolKind = vim.lsp.protocol.SymbolKind

	require("lsp-lens").setup({
		enable = true,
		include_declaration = true,
		sections = {
			definition = false,
			references = true,
			implements = true,
			git_authors = false,
		},
		ignore_filetype = {
			"prisma",
		},
		target_symbol_kinds = { SymbolKind.Function, SymbolKind.Method, SymbolKind.Interface },
		wrapper_symbol_kinds = { SymbolKind.Class, SymbolKind.Struct },
	})
end

return Lens
