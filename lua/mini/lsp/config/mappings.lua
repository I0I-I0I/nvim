-- Attach/Mappings
autocmd("LspAttach", {
	callback = function(event)
		local client = vim.lsp.get_client_by_id(event.data.client_id)

		if client.server_capabilities.inlayHintProvider then
			vim.lsp.inlay_hint.enable(event.buf, true)
		end

		if client.supports_method("textDocument/codeLens") then
			vim.lsp.codelens.refresh()
			vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
				buffer = event.buf,
				callback = vim.lsp.codelens.refresh,
			})
		end

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
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to references", buffer = event.buf })
		vim.keymap.set("n", "<leader>R", vim.lsp.buf.rename, { desc = "Rename", buffer = event.buf })
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Show code actions", buffer = event.buf })
		vim.keymap.set("n", "<leader>e", "<cmd>lua vim.diagnostic.open_float()<cr>", { desc = "Show float diagnostic" })
		vim.keymap.set("n", "<leader>lf", function()
			vim.lsp.buf.format({ async = true })
		end)
	end,
})
