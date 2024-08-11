local M = {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},
	event = "VeryLazy",
}

local servers = {
	"lua_ls",
	"emmet_language_server",
	"html",
	"cssls",
	"tsserver",
	"cssmodules_ls",
}

function M.config()
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

	vim.keymap.del("n", "grr")
	vim.keymap.del("n", "grn")
	vim.keymap.del({ "n", "v" }, "gra")

	-- Attach/Mappings
	autocmd("LspAttach", {
		callback = function(event)
			local client = vim.lsp.get_client_by_id(event.data.client_id)
			local opts = { buffer = event.buf }

			-- built-in completion for lsp
			-- if client.supports_method("textDocument/completion") then
			-- 	vim.lsp.completion.enable(true, client.id, event.buf, { autotrigger = true })
			-- else
			-- 	vim.bo[event.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
			-- end

			if client then
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
						require("telescope.builtin").lsp_definitions,
						desc = "Lsp Definitions",
					},
					["gr"] = {
						require("telescope.builtin").lsp_references,
						desc = "Lsp References",
					},
					["gD"] = {
						vim.lsp.buf.declaration,
						opts,
						desc = "Lsp declaration",
					},
					["gi"] = {
						vim.lsp.buf.implementation,
						opts,
						desc = "Lsp implementation",
					},
					["gtd"] = {
						vim.lsp.buf.type_definition,
						opts,
						desc = "Lsp type definition",
					},

					-- Custom
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
					["<leader>le"] = {
						vim.diagnostic.open_float,
						opts,
						desc = "Show line diagnostics",
					},
					["<leader>ll"] = { "<cmd>LspRestart<cr>", opts, desc = "Restart all lsp" },

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
				},
			})
		end,
	})
end

return M
