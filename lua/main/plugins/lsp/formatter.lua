local Formatter = {
	"stevearc/conform.nvim",
	event = "BufWritePre",
}

function Formatter.config()
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
			timeout_ms = 3000,
			async = false,
			quiet = false,
			lsp_fallback = true,
		},
	})
end

return Formatter
