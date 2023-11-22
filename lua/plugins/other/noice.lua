require("noice").setup({
	lsp = {
		progress = {
			enabled = false,
			format = "",
			format_done = "",
			throttle = 1000 / 30, -- frequency to update lsp progress message
			view = "mini",
		},
	},
	-- you can enable a preset for easier configuration
	presets = {
		bottom_search = true, -- use a classic bottom cmdline for search
		command_palette = true, -- position the cmdline and popupmenu together
		long_message_to_split = true, -- long messages will be sent to a split
		inc_rename = false, -- enables an input dialog for inc-rename.nvim
		lsp_doc_border = false, -- add a border to hover docs and signature help
	},
})

require("notify").setup({
	background_colour = "#ffffff",
})
