local M = {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		-- "hrsh7th/cmp-nvim-lsp",
	},
	event = "VeryLazy",
}

function M.config()
	local servers = {
		"lua_ls",
		"emmet_language_server",
		"html",
		"cssls",
		"tsserver",
		"cssmodules_ls",
	}

	local ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
    vim.g.capabilities = vim.lsp.protocol.make_client_capabilities()
	if ok then
		vim.g.capabilities = cmp_nvim_lsp.default_capabilities()
	end

	local server_path = vim.g.lsp_path .. "servers."

	require("mason").setup({
		ui = {
			icons = {
				package_pending = " ",
				package_installed = " ",
				package_uninstalled = " ",
			},
		},
	})
	require("mason-lspconfig").setup({
		ensure_installed = servers,
	})

	require("mason-lspconfig").setup_handlers({
		function(server_name)
			require("lspconfig")[server_name].setup(require(server_path .. server_name))
		end,
	})

	vim.diagnostic.config({
		sighns = true,
		underline = true,
		severity_sort = true,
		update_in_insert = false,
		virtual_text = {
			prefix = "",
			virt_text = {},
			source = false,
			format = function(diagnostic)
				local str = diagnostic.source:gsub("[.]", "")
				if str == "typescript" then
					str = "TypeScript server"
				end
				str = str .. " "
				return str
			end,
		},
		float = {
			focusable = true,
			border = "rounded",
			header = "",
			prefix = "",
			source = false,
		},
	})

	-- Handlers
	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "double",
		title = "hover",
	})

	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "double",
	})

	-- Attach/Mappings
	autocmd("LspAttach", {
		callback = function(event)
			local client = vim.lsp.get_client_by_id(event.data.client_id)
			local opts = { buffer = event.buf }

			-- vim.bo[event.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

			if client then
				if client.supports_method("textDocument/completion") then
					vim.lsp.completion.enable(true, client.id, event.buf, { autotrigger = true })
                    vim.opt.completeopt = { "menu", "menuone", "noselect" }
				end
				if client.server_capabilities.inlayHintProvider then
					vim.lsp.inlay_hint.enable(true)
				end
			end

			Bind({
				["n"] = {
					-- remap built-in maps
					["K"] = {
						vim.lsp.buf.hover,
						desc = "Lsp References",
					},
					["gd"] = {
						vim.lsp.buf.definition,
						desc = "Lsp References",
					},
					["gr"] = {
						require("telescope.builtin").lsp_references,
						desc = "Lsp Definitions",
					},

					-- Custom
					["<leader>lD"] = {
						vim.lsp.buf.declaration,
						opts,
						desc = "Lsp declaration",
					},
					["<leader>li"] = {
						vim.lsp.buf.implementation,
						opts,
						desc = "Lsp implementation",
					},
					["<leader>ltd"] = {
						vim.lsp.buf.type_definition,
						opts,
						desc = "Lsp type definition",
					},
					["<leader>lr"] = {
						vim.lsp.buf.rename,
						opts,
						desc = "Lsp rename",
					},
					["<leader>lca"] = {
						vim.lsp.buf.code_action,
						opts,
						desc = "Code actions",
					},

					-- Telescope
					["<leader>fr"] = {
						require("telescope.builtin").lsp_references,
						desc = "Lsp References",
					},
					["<leader>fd"] = {
						require("telescope.builtin").lsp_definitions,
						desc = "Lsp Definitions",
					},
					["<leader>fD"] = {
						require("telescope.builtin").diagnostics,
						desc = "Lsp Definitions",
					},

					["<leader>le"] = {
						vim.diagnostic.open_float,
						opts,
						desc = "Show line diagnostics",
					},

					-- Navigate through the diagnostic
					["]d"] = {
						function()
							vim.diagnostic.jump({ float = true, count = 1 })
						end,
						desc = "Lsp diagnostic go next",
					},
					["[d"] = {
						function()
							vim.diagnostic.jump({ float = true, count = -1 })
						end,
						desc = "Lsp diagnostic go prev",
					},

					-- Restart lsp servers
					["<leader>ll"] = { "<cmd>LspRestart<cr>", opts, desc = "Restart all lsp" },
				},
			})
		end,
	})
end

return M
