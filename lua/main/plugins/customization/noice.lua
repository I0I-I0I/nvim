local M = {
	"folke/noice.nvim",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
}

M.opts = {
	cmdline = {
		format = {
			cmdline = { pattern = "^:", icon = "󰞷", lang = "vim" },
			search_down = { kind = "search", pattern = "^/", icon = "  ", lang = "regex" },
			search_up = { kind = "search", pattern = "^%?", icon = "  ", lang = "regex" },
			filter = { pattern = "^:%s*!", icon = " ", lang = "bash" },
			lua = { pattern = { "^:%s*lua%s+", "^:%s*=%s*" }, icon = " ", lang = "lua" },
			help = { pattern = "^:%s*he?l?p?%s+", icon = "󰋖" },
			input = {}, -- Used by input()
		},
	},
	lsp = {
		bin_path = vim.api.nvim_call_function("stdpath", { "data" }) .. "/mason/bin/llm-ls",
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
			-- ["cmp.entry.get_documentation"] = true,
		},
		progress = {
			enabled = true,
			format = "lsp_progress",
			format_done = "lsp_progress_done",
			throttle = 1000 / 30,
			view = "mini",
		},
		hover = {
			enabled = false,
		},
		signature = {
			enabled = false,
		},
	},
	messages = {
		enabled = true, -- enables the Noice messages UI
		view = "notify", -- default view for messages
		view_error = "notify", -- view for errors
		view_warn = "notify", -- view for warnings
		view_history = "messages", -- view for :messages
		view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
	},
	presets = {
		bottom_search = false, -- use a classic bottom cmdline for search
		command_palette = false, -- position the cmdline and popupmenu together
		long_message_to_split = false, -- long messages will be sent to a split
		inc_rename = false, -- enables an input dialog for inc-rename.nvim
		lsp_doc_border = true, -- add a border to hover docs and signature help
	},
	commands = {
		errors = {
			filter = {
				event = "msg_show",
				min_height = 10,
				["not"] = { kind = { "search_count", "echo" } },
			},
		},
	},
}

return M
