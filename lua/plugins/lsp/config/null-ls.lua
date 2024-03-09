local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
	sources = {
		-- JavaScript, CSS, HTML
		null_ls.builtins.diagnostics.eslint.with({
			filetypes = {
				"typescript",
				"javascript",
				"typescriptreact",
				"javascriptreact",
			},
		}),

		null_ls.builtins.formatting.prettierd.with({
			filetypes = {
				"css",
				"scss",
				"less",
				"html",
				"json",
				"jsonc",
				"yaml",
				"markdown",
				"markdown.mdx",
				"graphql",
				"handlebars",
				"javascript",
				"typescript",
			},
		}),

		null_ls.builtins.diagnostics.stylelint,

		-- Lua
		null_ls.builtins.formatting.stylua,

		-- Python
		null_ls.builtins.diagnostics.ruff,

		null_ls.builtins.formatting.black,

		-- Git
		null_ls.builtins.code_actions.gitsigns,
	},

	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({
						bufnr = bufnr,
						filter = function(client)
							return client.name == "null-ls"
						end,
					})
					-- vim.lsp.buf.formatting_sync()
				end,
			})
		end
	end,
})
