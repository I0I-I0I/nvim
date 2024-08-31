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
	"html",
	"cssls",
	"cssmodules_ls",
	"css_variables",
}

local function feedkeys(keys)
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(keys, true, false, true), 'n', true)
end

---Is the completion menu open?
local function pumvisible()
	return tonumber(vim.fn.pumvisible()) ~= 0
end

function M.config()
	local ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
	vim.g.capabilities = vim.lsp.protocol.make_client_capabilities()
	if ok then
		vim.g.capabilities = cmp_nvim_lsp.default_capabilities()
	end

	require("mason").setup()
	require("mason-lspconfig").setup({
		ensure_installed = servers,
	})
	require("mason-lspconfig").setup_handlers({
		function(server_name)
			require("lspconfig")[server_name].setup(require(vim.g.lsp_path .. "servers." .. server_name))
		end,
	})

	vim.diagnostic.config({
		sighns = true,
		underline = true,
		severity_sort = true,
		virtual_text = { prefix = "" },
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

			vim.keymap.set("i", "<C-y>", function()
				if pumvisible() then
					feedkeys "<C-y>"
				else
					if next(vim.lsp.get_clients { bufnr = 0 }) then
						vim.lsp.completion.trigger()
					else
						if vim.bo.omnifunc == "" then
							feedkeys "<C-x><C-n>"
						else
							feedkeys "<C-x><C-o>"
						end
					end
				end
			end)
			vim.keymap.set("i", "<C-u>", "<C-x><C-n>", { desc = "Buffer completions" })

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
					["<leader>f"] = {
						function ()
							vim.lsp.buf.format({ async = true, timeout_ms = 500 })
						end,
						desc = "Format file",
					},

					-- Custom
					["<leader>r"] = {
						vim.lsp.buf.rename,
						opts,
						desc = "Lsp rename",
					},
					["<leader>lc"] = {
						vim.lsp.buf.code_action,
						opts,
						desc = "Code actions",
					},
					["<leader>e"] = {
						vim.diagnostic.open_float,
						opts,
						desc = "Show line diagnostics",
					},
					["<leader>ll"] = { "<cmd>LspRestart<cr>", opts, desc = "Restart all lsp" },

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
