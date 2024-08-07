local M = {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"pmizio/typescript-tools.nvim",
	},
	event = "VeryLazy",
}

function M.config()
	local ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
	if ok then
		vim.g.capabilities = cmp_nvim_lsp.default_capabilities()
	else
		vim.g.capabilities = vim.lsp.protocol.make_client_capabilities()
	end

	-- Servers

	local servers = {
		"lua_ls",
		"html",
		"cssls",
		"emmet_language_server",
		"tsserver",
		"cssmodules_ls",
	}

	local server_path = vim.g.config_path .. ".plugins.lsp.servers."

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

	local lspconfig = require("lspconfig")
	lspconfig.opts = {
		inlay_hints = {
			enabled = true,
		},
		codelens = {
			enabled = false,
		},
	}

	-- Diagnostic

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
			source = true,
		},
	})

	local signs = {
		Error = LspIcons.error,
		Warn = LspIcons.warn,
		Hint = LspIcons.hint,
		Info = LspIcons.info,
	}
	for type, icon in pairs(signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
	end

	-- Mappings

	autocmd("LspAttach", {
		group = augroup("UserLspConfig", {}),
		callback = function(ev)
			local client = vim.lsp.get_client_by_id(ev.data.client_id)
			local opts = { buffer = ev.buf }

			vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

			if client then
				-- if client.supports_method("textDocument/completion") then
				--     vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = false })
				-- end
				if client.server_capabilities.inlayHintProvider then
					vim.lsp.inlay_hint.enable(true, {
						bufnr = ev.buf,
					})
				end
			end

			Bind({
				["n"] = {
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

					["<leader>fr"] = {
						require("telescope.builtin").lsp_references,
						desc = "Lsp References",
					},
					["<leader>fd"] = {
						require("telescope.builtin").lsp_definitions,
						desc = "Lsp Definitions",
					},

					["<leader>le"] = {
						vim.diagnostic.open_float,
						opts,
						desc = "Show line diagnostics",
					},

					["<leader>ll"] = { "<cmd>LspRestart<cr>", opts, desc = "Restart all lsp" },
				},
			})
		end,
	})
end

return M
