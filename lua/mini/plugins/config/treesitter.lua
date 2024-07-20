local installed = {
	"lua",
	"python",
	"javascript",
	"typescript",
	"tsx",
	"json",
	"html",
	"css",
	"markdown",
	"markdown_inline",
	"bash",
	"gitignore",
	"vim",
	"http",
	"xml",
	"graphql",
}

local treesitter = require("nvim-treesitter.configs")

treesitter.setup({
	ensure_installed = installed,
	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	indent = {
		enable = true,
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "gnn",
			node_incremental = "grn",
			scope_incremental = "grc",
			node_decremental = "grm",
		},
	},
})
