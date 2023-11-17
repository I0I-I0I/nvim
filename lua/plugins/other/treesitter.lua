require("nvim-treesitter.configs").setup({
	ensure_installed = { "lua", "python", "javascript", "tsx", "json", "html", "css", "markdown", "markdown_inline" },

	sync_install = false,
	auto_install = true,

	highlight = {
		enable = true,
	},

	indent = {
		enable = true,
	},

	autotag = {
		enable = true,
	},
})
