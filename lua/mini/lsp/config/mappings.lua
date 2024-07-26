-- Attach/Mappings
autocmd("LspAttach", {
	callback = function(event)
		local bufnr = event.buf
		local client = vim.lsp.get_client_by_id(event.data.client_id)

		Bind({
			["n"] = {
				["K"] = { vim.lsp.buf.hover, { desc = "Show hover", buffer = event.buf } },
				["gd"] = { "<cmd>Telescope lsp_definitions<cr>", { desc = "Go to definition", buffer = event.buf } },
				["gr"] = { "<cmd>Telescope lsp_references<cr>", { desc = "Go to references", buffer = event.buf } },
				["<plugleader>li"] = { vim.lsp.buf.implementation, { desc = "Go to references", buffer = event.buf } },
				["<plugleader>lr"] = { vim.lsp.buf.rename, { desc = "Rename", buffer = event.buf } },
				["<plugleader>lca"] = { vim.lsp.buf.code_action, { desc = "Show code actions", buffer = event.buf } },
				["<plugleader>le"] = { "<cmd>lua vim.diagnostic.open_float()<cr>", { desc = "Show float diagnostic" } },
				["<plugleader>lf"] = {
					function()
						vim.lsp.buf.format({ async = true })
					end,
				},
			},
		})
	end,
})
