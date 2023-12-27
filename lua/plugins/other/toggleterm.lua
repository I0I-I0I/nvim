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
		enabled = false,
		name_formatter = function(term)
			return term.name
		end,
	},
})

function TransparentToggleTerm()
	local args = {
		"ToggleTerm1Normal",
		"ToggleTerm1WinBar",
		"ToggleTerm1WinBarNC",
	}
	for _, name in ipairs(args) do
		vim.api.nvim_set_hl(0, name, { bg = "none" })
	end
end

vim.api.nvim_create_user_command("TransparentToggleTerm", TransparentToggleTerm, {})

vim.keymap.set("n", "<C-\\>", "<cmd>ToggleTerm<cr><cmd>TransparentToggleTerm<cr>")
