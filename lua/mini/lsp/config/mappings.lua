-- Attach/Mappings
autocmd("LspAttach", {
	callback = function(event)
		local bufnr = event.buf
		local client = vim.lsp.get_client_by_id(event.data.client_id)

		vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show hover", buffer = event.buf })
		vim.keymap.set(
			"n",
			"gd",
			"<cmd>Telescope lsp_definitions<cr>",
			{ desc = "Go to definition", buffer = event.buf }
		)
		vim.keymap.set(
			"n",
			"gr",
			"<cmd>Telescope lsp_references<cr>",
			{ desc = "Go to references", buffer = event.buf }
		)
		vim.keymap.set("n", "<leader>li", vim.lsp.buf.implementation, { desc = "Go to references", buffer = event.buf })
		vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, { desc = "Rename", buffer = event.buf })
		vim.keymap.set("n", "<leader>lca", vim.lsp.buf.code_action, { desc = "Show code actions", buffer = event.buf })
		vim.keymap.set(
			"n",
			"<leader>le",
			"<cmd>lua vim.diagnostic.open_float()<cr>",
			{ desc = "Show float diagnostic" }
		)
		vim.keymap.set("n", "<leader>lf", function()
			vim.lsp.buf.format({ async = true })
		end)
	end,
})
