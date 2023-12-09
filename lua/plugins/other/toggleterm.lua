require("toggleterm").setup({
	size = 15,
	open_mapping = [[<c-\>]],
	shade_filetypes = {},
	autochdir = false,
	shade_terminals = true,
	start_in_insert = true,
	insert_mappings = true,
	terminal_mappings = true,
	persist_size = true,
	persist_mode = true,
	direction = "horizontal",
	close_on_exit = true,
	shell = vim.o.shell,
	auto_scroll = true,
	float_opts = {
		border = "curved",
		winblend = 3,
		zindex = 100,
	},
	winbar = {
		enabled = true,
		name_formatter = function(term)
			return term.name
		end,
	},
})
