local M = {
	"stevearc/conform.nvim",
	event = "BufWritePre",
}

function M.config()
	local conform = require("conform")
	conform.setup({
		formatters_by_ft = {
			javascript = { "prettierd" },
			typescript = { "prettierd" },
			javascriptreact = { "prettierd" },
			typescriptreact = { "prettierd" },
			html = { "prettierd" },
			css = { "prettierd" },
			json = { "prettierd" },
			yaml = { "prettierd" },
			markdown = { "prettierd" },
			graphql = { "prettierd" },
			lua = { "stylua" },
			python = { "black" },
		},
		format_on_save = {
			timeout_ms = 500,
			async = false,
			quiet = false,
			lsp_fallback = true,
		},
	})

	Bind({
		["n"] = {
			["<plugleader>lF"] = {
				function(args)
					conform.format({ bufnr = args.buf })
				end,
				{ silent = true, noremap = true },
				desc = "Conform format",
			},
		},
	})
end

return M
