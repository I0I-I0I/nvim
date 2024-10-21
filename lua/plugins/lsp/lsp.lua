local M = {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},
	event = "VeryLazy",
}

function M.config()
	local ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
	vim.g.capabilities = vim.lsp.protocol.make_client_capabilities()
	if ok then
		vim.g.capabilities = cmp_nvim_lsp.default_capabilities()
	end

	require("mason").setup()
	require("mason-lspconfig").setup({
		ensure_installed = vim.g.lsp_servers,
	})
	require("mason-lspconfig").setup_handlers({
		function(server_name)
			require("lspconfig")[server_name].setup(
				require(vim.g.lsp_path .. "servers." .. server_name)
			)
		end,
	})

	-- Attach/Mappings
	autocmd("LspAttach", {
		callback = function(event)
			local client = vim.lsp.get_client_by_id(event.data.client_id)
			local opts = { buffer = event.buf }

			-- built-in completion for lsp
			if client then
				if client.supports_method("textDocument/completion") then
					vim.lsp.completion.enable(true, client.id, event.buf, { autotrigger = false })
				else
					vim.bo[event.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
				end

				if client.server_capabilities.inlayHintProvider then
					vim.lsp.inlay_hint.enable(true)
				end
			end

			vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Lsp Definitions" })
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { table.insert(opts, { desc = "Lsp declaration" }) })
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { table.insert(opts, { desc = "Lsp implementation" }) })
			vim.keymap.set("n", "gtd", vim.lsp.buf.type_definition,
				{ table.insert(opts, { desc = "Lsp type definition" }) })
			vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float,
				{ table.insert(opts, { desc = "Show line diagnostics" }) })
			vim.keymap.set("n", "<leader>ll", "<cmd>LspRestart<cr>", { table.insert(opts, { desc = "Restart all lsp" }) })
			vim.keymap.set("n", "<leader>f", function()
				vim.lsp.buf.format({ async = true, timeout_ms = 500 })
			end,
				{ desc = "Format file" }
			)
			vim.keymap.set("n", "]d", function()
				vim.diagnostic.jump({ float = true, count = 1 })
			end,
				{ desc = "Lsp diagnostic go next" }
			)
			vim.keymap.set("n", "[d", function()
				vim.diagnostic.jump({ float = true, count = -1 })
			end,
				{ desc = "Lsp diagnostic go prev" }
			)
		end,
	})
end

return M
