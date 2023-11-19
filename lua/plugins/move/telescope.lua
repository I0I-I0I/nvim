local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fw", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
vim.keymap.set("n", "gr", builtin.lsp_references, { noremap = true, silent = true })
vim.keymap.set("n", "gd", builtin.lsp_definitions, { noremap = true, silent = true })

require("telescope").setup({
	defaults = {
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
			"--ignore-file",
			"/home/i0i/.config/nvim/ignore.files",
		},
		file_ignore_patterns = {
			"package-lock.json",
			"node_modules",
			".git",
			"dist",
		},
	},
})
