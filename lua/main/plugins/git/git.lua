local git = {
	"lewis6991/gitsigns.nvim",
	event = "BufRead",
}

function git.config()
	require("gitsigns").setup({
		signs = {
			add = { text = "┃" },
			change = { text = "┃" },
			delete = { text = "_" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
			untracked = { text = "┆" },
		},
		current_line_blame_opts = {
			virt_text = true,
			virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
			delay = 300,
			ignore_whitespace = false,
			virt_text_priority = 100,
		},
	})

	vim.keymap.set("n", "<leader>gn", "<cmd>Gitsigns next_hunk<cr>", { silent = true })
	vim.keymap.set("n", "<leader>gp", "<cmd>Gitsigns prev_hunk<cr>", { silent = true })
	vim.keymap.set("n", "<leader>gs", "<cmd>Gitsigns preview_hunk<cr>", { silent = true })
	vim.keymap.set("n", "<leader>gd", "<cmd>Gitsigns toggle_deleted<cr>", { silent = true })
	vim.keymap.set("n", "<leader>gl", "<cmd>Gitsigns toggle_current_line_blame<cr>", { silent = true })
end

return git
