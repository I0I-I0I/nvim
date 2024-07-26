vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

require("nvim-tree").setup({
	sort = {
		sorter = "case_sensitive",
	},
	view = {
		width = 30,
	},
	filters = {
		custom = { "node_modules", "\\.git$" },
	},
	modified = {
		enable = true,
		show_on_dirs = false,
		show_on_open_dirs = false,
	},
	tab = {
		sync = {
			open = true,
			close = true,
			ignore = {},
		},
	},
	update_focused_file = {
		enable = true,
		update_root = {
			enable = false,
			ignore_list = {},
		},
		exclude = false,
	},
})

Bind({
	["n"] = {
		["<plugleader>n"] = { "<cmd>NvimTreeToggle<cr>" },
	},
})
