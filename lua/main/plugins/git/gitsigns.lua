local M = {
	"lewis6991/gitsigns.nvim",
	event = "BufRead",
}

M.opts = {
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
}

M.keys = {
	{ "<leader>gn", "<cmd>Gitsigns next_hunk<cr>", { silent = true }, desc = "Gitsigns next hunk" },
	{ "<leader>gp", "<cmd>Gitsigns prev_hunk<cr>", { silent = true }, desc = "Gitsigns prev hunk" },
	{
		"<leader>gs",
		"<cmd>Gitsigns preview_hunk<cr>",
		{ silent = true },
		desc = "Gitsigns preview hunk",
	},
	{
		"<leader>gd",
		"<cmd>Gitsigns toggle_deleted<cr>",
		{ silent = true },
		desc = "Gitsigns toggle deleted",
	},
	{
		"<leader>gl",
		"<cmd>Gitsigns toggle_current_line_blame<cr>",
		{ silent = true },
		desc = "Gitsigns toggle current line blame",
	},
}

return M
