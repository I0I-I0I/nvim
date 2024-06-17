local LspSaga = {
	"nvimdev/lspsaga.nvim",
	event = { "BufRead", "BufNewFile" },
}

function LspSaga.config()
	local saga = require("lspsaga")

	saga.setup({
		lightbulb = {
			enable = false,
		},
		definition = {
			width = 0.8,
			height = 0.8,
		},
		code_action = {
			show_server_name = true,
			extend_gitsings = true,
		},
		symbol_in_winbar = {
			enable = true,
			hide_keyword = true,
		},
		ui = {
			border = "rounded",
			actionfix = "",
			code_action = "💡",
			collapse = "⊟",
			expand = "⊞",
			title = true,
			devicon = true,
			imp_sign = "󰳛 ",
		},
	})

	local opts = { noremap = true, silent = true }

	vim.keymap.set("n", "<leader>lk", "<cmd>Lspsaga hover_doc<cr>", opts)
	vim.keymap.set("n", "<leader>lr", "<cmd>Lspsaga rename<cr>", opts)
	vim.keymap.set("n", "<leader>ld", "<cmd>Lspsaga peek_definition<cr>", opts)
	vim.keymap.set("n", "<leader>lca", "<cmd>Lspsaga code_action<cr>", opts)
	vim.keymap.set("n", "<leader>lf", "<cmd>Lspsaga finder<cr>", opts)
	vim.keymap.set("n", "<leader>lo", "<cmd>Lspsaga outline<cr>", opts)
	vim.keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<cr>", opts)
	vim.keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opts)
	vim.keymap.set({ "n", "t" }, "<C-\\>", "<cmd>Lspsaga term_toggle<cr>")
end

return LspSaga
