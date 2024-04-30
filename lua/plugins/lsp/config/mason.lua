return {
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
		config = function()
			require("mason").setup()

			require("mason-tool-installer").setup({
				ensure_installed = {
					"black",
					"css-lsp",
					"emmet-language-server",
					"eslint_d",
					"html-lsp",
					"lua-language-server",
					"prettierd",
					"pyright",
					"stylelint-lsp",
					"stylua",
					"tsserver",
				},
				auto_update = true,
				run_on_start = true,
				start_delay = 3000, -- 3 second delay
				debounce_hours = 5, -- at least 5 hours between attempts to install/update
			})

			vim.api.nvim_create_autocmd("User", {
				pattern = "MasonToolsStartingInstall",
				callback = function()
					vim.schedule(function()
						print("mason-tool-installer is starting")
					end)
				end,
			})

			vim.api.nvim_create_autocmd("User", {
				pattern = "MasonToolsUpdateCompleted",
				callback = function(e)
					vim.schedule(function()
						print(vim.inspect(e.data)) -- print the table that lists the programs that were installed
					end)
				end,
			})
		end,
	},
}
