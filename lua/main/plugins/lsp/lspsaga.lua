local M = {
	"nvimdev/lspsaga.nvim",
	event = { "BufRead", "BufNewFile" },
}

function M.init()
	if not COLOR then
		vim.cmd("hi DevIconDefault guifg=#d3d7cf")
	end
end

function M.config()
	local lspsaga = require("lspsaga")

	lspsaga.setup({
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
			hide_keyword = false,
			color_mode = true,
			delay = 300,
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
end

local opts = { noremap = true, silent = true }

M.keys = {
	{ "<leader>lk", "<cmd>Lspsaga hover_doc<cr>", opts, desc = "Lspsaga hover_doc" },
	{ "<leader>ld", "<cmd>Lspsaga peek_definition<cr>", opts, desc = "Lspsaga peek definition" },
	{ "<leader>lca", "<cmd>Lspsaga code_action<cr>", opts, desc = "Lspsaga code action" },
	{ "<leader>lf", "<cmd>Lspsaga finder<cr>", opts, desc = "Lspsaga finder" },
	{ "<leader>lo", "<cmd>Lspsaga outline<cr>", opts, desc = "Lspsaga outline" },
	{ "]d", "<cmd>Lspsaga diagnostic_jump_next<cr>", opts, desc = "Lspsaga diagnostics jump next" },
	{ "[d", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opts, desc = "Lspsaga diagnostics jump prev" },
}

return M
