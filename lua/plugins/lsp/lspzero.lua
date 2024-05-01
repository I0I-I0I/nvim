local lspzero = {
	"VonHeikemen/lsp-zero.nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
		{
			"pmizio/typescript-tools.nvim",
			dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		},
	},
	branch = "v3.x",
	event = { "BufReadPre", "BufNewFile" },
}

function lspzero.config()
	lspconfig = require("lspconfig")
	lsp_zero = require("lsp-zero")
	capabilities = require("cmp_nvim_lsp").default_capabilities()

	lsp_zero.on_attach(function(client, bufnr)
		lsp_zero.default_keymaps({
			buffer = bufnr,
			exclude = { "K", "gd", "gr", "<C-k>", "<leader>f" },
		})

		local opts = { noremap = true, silent = true }

		vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<cr>", opts)
		vim.keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<cr>", opts)
		vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, opts)
		vim.keymap.set("n", "<leader>fd", require("telescope.builtin").lsp_definitions, opts)
	end)

	lsp_zero.set_sign_icons({
		error = "✘",
		warn = "▲",
		hint = "⚑",
		info = "»",
	})

	-- Servers

	local function importServer(server)
		local servers = "plugins.lsp.servers."
		return require(servers .. server)
	end

	require("mason-lspconfig").setup({
		handlers = {
			lsp_zero.default_setup,

			lua_ls = importServer("lua_ls"),
			cssls = importServer("cssls"),
			emmet_language_server = importServer("emmet_ls"),
			html = importServer("html"),
			pylsp = importServer("pylsp"),
			tsserver = importServer("tsserver"),
		},
	})

	-- Mappings

	vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
	vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
	vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
	vim.keymap.set("n", "<leader>Q", vim.diagnostic.setloclist)

	vim.api.nvim_create_autocmd("LspAttach", {
		group = vim.api.nvim_create_augroup("UserLspConfig", {}),
		callback = function(ev)
			local client = vim.lsp.get_client_by_id(ev.data.client_id)
			if client.server_capabilities.inlayHintProvider then
				vim.lsp.inlay_hint.enable(ev.buf, true)
			end

			vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

			local opts = { buffer = ev.buf }
			-- vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
			-- vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
			-- vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
			-- vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
			vim.keymap.set("n", "gI", vim.lsp.buf.implementation, opts)
			vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
			vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
			vim.keymap.set("n", "<leader>wl", function()
				print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
			end, opts)
			vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
		end,
	})
end

return lspzero
