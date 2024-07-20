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

			-- if client.supports_method("textDocument/codeLens") then
			-- 	vim.lsp.codelens.refresh()
			-- 	vim.api.nvim_command(
			-- 		[[autocmd BufEnter,CursorHold,InsertLeave <buffer> lua vim.lsp.codelens.refresh({ bufnr = 0 })]]
			-- 	)
			-- 	vim.api.nvim_buf_set_keymap(
			-- 		ev.buf,
			-- 		"n",
			-- 		"<leader>ll",
			-- 		"<Cmd>lua vim.lsp.codelens.run()<CR>",
			-- 		{ silent = true }
			-- 	)
			-- end

			-- vim.keymap.set("n", "<leader>le", vim.diagnostic.open_float)

			vim.keymap.set("n", "<leader>lD", vim.lsp.buf.declaration, opts)
			vim.keymap.set("n", "<leader>li", vim.lsp.buf.implementation, opts)
			vim.keymap.set("n", "<leader>ltd", vim.lsp.buf.type_definition, opts)

			vim.keymap.set("n", "<leader>fr", require("telescope.builtin").lsp_references)
			vim.keymap.set("n", "<leader>fd", require("telescope.builtin").lsp_definitions)
		end,
	})
end

return M
