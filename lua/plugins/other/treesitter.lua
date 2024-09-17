local M = {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-context"
	},
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
	local treesitter_context = require("treesitter-context")

	treesitter_context.setup({
		enable = true,
		max_lines = 10,
		min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
		line_numbers = true,
		multiline_threshold = 20, -- Maximum number of lines to show for a single context
		trim_scope = 'inner', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
		mode = 'topline',  -- Line used to calculate context. Choices: 'cursor', 'topline'
		-- Separator between context and content. Should be a single character string, like '-'.
		-- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
		separator = nil,
		zindex = 20, -- The Z-index of the context window
		on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
	})

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
