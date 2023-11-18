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
