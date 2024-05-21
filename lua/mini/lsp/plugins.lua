return {
	-- Mason
	Plug("williamboman/mason.nvim"),

	-- Linter/Foramtter
	Plug("mfussenegger/nvim-lint"),
	Plug("stevearc/conform.nvim"),

	-- Cmp
	Plug("hrsh7th/nvim-cmp"),
	Plug("hrsh7th/cmp-nvim-lsp"),
	Plug("hrsh7th/cmp-cmdline"),
	-- Snippets
	Plug("L3MON4D3/LuaSnip", { ["tag"] = "v2.*", ["do"] = "make install_jsregexp" }),
	Plug("saadparwaiz1/cmp_luasnip"),
	Plug("rafamadriz/friendly-snippets"),
}
