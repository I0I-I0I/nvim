local M = {
	"stevearc/conform.nvim",
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
}

M.keys = {
	{
		"<leader>f",
		function()
			require("conform").format({ async = true })
		end,
		desc = "Formating file",
	},
}

return M
