local M = {
	"stevearc/conform.nvim",
	event = "BufWritePre",
}

M.opts = {
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
}

M.keys = {
	{
		"<leader>lF",
		function(args)
			require("conform").format({ bufnr = args.buf })
		end,
		{ silent = true, noremap = true },
		desc = "Conform format",
	},
}

return M
