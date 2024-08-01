local M = {
	"VonHeikemen/lsp-zero.nvim",
	dependencies = {
		{ "neovim/nvim-lspconfig" },
		{
			"pmizio/typescript-tools.nvim",
			dependencies = {
				"nvim-lua/plenary.nvim",
				"neovim/nvim-lspconfig",
			},
		},
		{
			"williamboman/mason.nvim",
			dependencies = { "williamboman/mason-lspconfig.nvim" },
		},
	},
	branch = "v3.x",
	event = { "BufReadPre", "BufNewFile" },
}

function M.config()
	lspconfig = require("lspconfig")
	lsp_zero = require("lsp-zero")
	capabilities = require("cmp_nvim_lsp").default_capabilities()

	lspconfig.opts = {
		inlay_hints = {
			enabled = true,
		},
		codelens = {
			enabled = false,
		},
	}

	vim.diagnostic.config({
		sighns = true,
		underline = true,
		severity_sort = true,
		update_in_insert = false,
		virtual_text = false,
		float = {
			focusable = false,
			border = "rounded",
			header = "",
			prefix = "",
			source = true,
		},
	})

	lsp_zero.set_sign_icons({
		error = LspIcons.error,
		warn = LspIcons.warn,
		hint = LspIcons.hint,
		info = LspIcons.info,
	})

	-- Servers

	local servers = "main.plugins.lsp.servers."
	local function importServer(server)
		return require(servers .. server)
	end

	require("mason").setup()
	require("mason-lspconfig").setup({
		ensure_installed = {
			"lua_ls",
			"html",
			"cssls",
			"emmet_language_server",
			"pylsp",
			"stylelint_lsp",
			"cssmodules_ls",
		},

		-- "stylua",
		-- "eslint_d",
		-- "prettierd",
		-- "htmlhint",
		-- "pylint",
		-- "black",

		handlers = {
			lsp_zero.default_setup,

			lua_ls = importServer("lua_ls"),
			html = importServer("html"),
			cssls = importServer("cssls"),
			emmet_language_server = importServer("emmet_ls"),
			pylsp = importServer("pylsp"),
			tsserver = importServer("tsserver"),
			stylelint_lsp = importServer("stylelint_lsp"),
			cssmodules_ls = importServer("cssmodules_ls"),
		},
	})

	-- Mappings

	autocmd("LspAttach", {
		group = augroup("UserLspConfig", {}),
		callback = function(ev)
			local client = vim.lsp.get_client_by_id(ev.data.client_id)
			local opts = { buffer = ev.buf }

			vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

			if client.server_capabilities.inlayHintProvider then
				vim.lsp.inlay_hint.enable(true)
			end

			Bind({
				["n"] = {
					["<plugleader>lD"] = {
						vim.lsp.buf.declaration,
						opts,
						desc = "Lsp declaration",
					},
					["<plugleader>li"] = {
						vim.lsp.buf.implementation,
						opts,
						desc = "Lsp implementation",
					},
					["<plugleader>ltd"] = {
						vim.lsp.buf.type_definition,
						opts,
						desc = "Lsp type definition",
					},
					["<plugleader>lr"] = {
						vim.lsp.buf.rename,
						opts,
						desc = "Lsp rename",
					},

					["<plugleader>fr"] = {
						require("telescope.builtin").lsp_references,
						desc = "Lsp References",
					},
					["<plugleader>fd"] = {
						require("telescope.builtin").lsp_definitions,
						desc = "Lsp Definitions",
					},
					-- ["<plugleader>le"] = {  vim.diagnostic.open_float },
				},
			})
		end,
	})
end

return M
