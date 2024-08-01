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

	if not COLOR then
		vim.cmd("hi DevIconDefault guifg=#d3d7cf")
	end

	local opts = { noremap = true, silent = true }

	Bind({
		["n"] = {
			["<plugleader>lk"] = {
				"<cmd>Lspsaga hover_doc<cr>",
				opts,
				desc = "Lspsaga hover_doc",
			},
			["<plugleader>ld"] = {
				"<cmd>Lspsaga peek_definition<cr>",
				opts,
				desc = "Lspsaga peek definition",
			},
			["<plugleader>lca"] = {
				"<cmd>Lspsaga code_action<cr>",
				opts,
				desc = "Lspsaga code action",
			},
			["<plugleader>lf"] = {
				"<cmd>Lspsaga finder<cr>",
				opts,
				desc = "Lspsaga finder",
			},
			["<plugleader>lo"] = {
				"<cmd>Lspsaga outline<cr>",
				opts,
				desc = "Lspsaga outline",
			},
			["<plugleader>le"] = {
				"<cmd>Lspsaga show_line_diagnostics<cr>",
				opts,
				desc = "Lspsaga show line diagnostics",
			},
			["]d"] = {
				"<cmd>Lspsaga diagnostic_jump_next<cr>",
				opts,
				desc = "Lspsaga diagnostics jump next",
			},
			["[d"] = {
				"<cmd>Lspsaga diagnostic_jump_prev<cr>",
				opts,
				desc = "Lspsaga diagnostics jump prev",
			},
		},
	})
end

return LspSaga
