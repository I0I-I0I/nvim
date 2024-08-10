local M = {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufRead", "BufNewFile" },
}

local languages = {
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

function M.config()
	local treesitter = require("nvim-treesitter.configs")

	treesitter.setup({
		ensure_installed = languages,
		sync_install = false,
		auto_install = true,
		query_linter = {
			enable = true,
			use_virtual_text = true,
			lint_events = { "BufWrite", "CursorHold" },
		},
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
		indent = {
			enable = true,
		},
	})
end

return M
