local M = {
	"akinsho/toggleterm.nvim",
	version = "*",
	event = "VeryLazy",
}

function M.config()
	require("toggleterm").setup({
		on_open = function()
			vim.cmd([[
		              hi ToggleTerm1Normal guibg=NONE
		              hi ToggleTerm1SignColumn guibg=NONE
		              hi ToggleTerm1EndOfBuffer guibg=NONE guifg=#000000
		              hi ToggleTerm2Normal guibg=NONE
		              hi ToggleTerm2SignColumn guibg=NONE
		              hi ToggleTerm2EndOfBuffer guibg=NONE guifg=#000000
		          ]])
		end,
		direction = "vertical",
	})
end

M.keys = {
	{
		"<leader>T",
		"<cmd>ToggleTerm direction=vertical size=50<cr>",
		{ silent = true, noremap = true },
		desc = "Toggle terminal",
	},
}

return M
