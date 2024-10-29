local M = { "nvim-treesitter/nvim-treesitter" }

M.build = ":TSUpdate"
M.event = { "BufRead", "BufNewFile" }

M.config = function()
	local treesitter = require("nvim-treesitter.configs")

	treesitter.setup({
		ensure_installed = {
			"lua",
			"json",
			"html",
			"css",
			"markdown",
			"markdown_inline",
			"bash",
			"gitignore",
			"vim",
		},
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
