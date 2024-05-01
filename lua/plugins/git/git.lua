local git = {
	"lewis6991/gitsigns.nvim",
	event = "BufRead",
}

function git.config()
	require("gitsigns").setup({
		signs = {
			add = { text = "+" },
			delete = { text = "-" },
			topdelete = { text = "-" },
			change = { text = "~" },
			changedelete = { text = "~" },
			untracked = { text = "|" },
		},
	})

	vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
	vim.keymap.set("n", "<leader>gn", ":Gitsigns next_hunk<cr>")
	vim.keymap.set("n", "<leader>gp", ":Gitsigns prev_hunk<cr>")
	vim.keymap.set("n", "<leader>gs", ":Gitsigns preview_hunk<cr>")
end

return git
