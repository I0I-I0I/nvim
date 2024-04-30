return {
	{
		"VonHeikemen/lsp-zero.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
		},
		branch = "v3.x",
		config = function()
			-- Setup language servers.
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			lsp_zero = require("lsp-zero")

			function lua_ls()
				local lua_opts = lsp_zero.nvim_lua_ls()
				lspconfig.lua_ls.setup(lua_opts)
			end

			function cssls()
				lspconfig.cssls.setup({
					filetypes = { "css" },
				})
			end

			function emmet_ls()
				lspconfig.emmet_language_server.setup({
					filetypes = {
						"css",
						"eruby",
						"html",
						"javascriptreact",
						"less",
						"sass",
						"scss",
						"svelte",
						"pug",
						"typescriptreact",
						"vue",
					},
					init_options = {
						--- @type string[]
						excludeLanguages = {},
						--- @type string[]
						extensionsPath = {},
						--- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/preferences/)
						preferences = {},
						--- @type boolean Defaults to `true`
						showAbbreviationSuggestions = true,
						--- @type "always" | "never" Defaults to `"always"`
						showExpandedAbbreviation = "always",
						--- @type boolean Defaults to `false`
						showSuggestionsAsSnippets = false,
						--- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/syntax-profiles/)
						syntaxProfiles = {},
						--- @type table<string, string> [Emmet Docs](https://docs.emmet.io/customization/snippets/#variables)
						variables = {},
					},
				})
			end

			function python()
				lspconfig.py_lsp.setup({
					filetypes = { "python" },
					language_server = "pylsp",
					source_strategies = { "poetry", "default", "system" },
					handlers = {
						source_definition = function(err, locations) end,
						file_references = function(err, locations) end,
						code_action = function(err, actions) end,
					},
				})
			end

			function html()
				lspconfig.html.setup({
					filetypes = { "html" },
				})
			end

			lsp_zero.on_attach(function(client, bufnr)
				lsp_zero.default_keymaps({ buffer = bufnr })
			end)

			require("mason-lspconfig").setup({
				handlers = {
					lsp_zero.default_setup,

					lua_ls = lua_ls,
					cssls = cssls,
					emmet_language_server = emmet_ls,
					python = python,
					html = html,
				},
			})

			-- Global mappings.
			-- See `:help vim.diagnostic.*` for documentation on any of the below functions
			vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
			vim.keymap.set("n", "<leader>Q", vim.diagnostic.setloclist)

			-- Use LspAttach autocommand to only map the following keys
			-- after the language server attaches to the current buffer
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					-- Enable completion triggered by <c-x><c-o>
					vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

					-- Buffer local mappings.
					-- See `:help vim.lsp.*` for documentation on any of the below functions
					local opts = { buffer = ev.buf }
					-- vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
					-- vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "gI", vim.lsp.buf.implementation, opts)
					-- vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
					vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
					vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
					vim.keymap.set("n", "<leader>wl", function()
						print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
					end, opts)
					vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
					vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
					-- vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
					vim.keymap.set("n", "<leader>f", function()
						vim.lsp.buf.format({ async = true })
					end, opts)
				end,
			})
		end,
	},
}
