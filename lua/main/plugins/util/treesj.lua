local M = {
	"Wansmer/treesj",
}

M.opts = {
	use_default_keymaps = false,
	join = {
		space_in_brackets = true,
		space_separator = false,
		force_insert = "",
	},
}

M.keys = {
	{
		"<leader>j",
		function()
			require("treesj").toggle()
		end,
		{ silent = true },
		desc = "TreeSJ Toggle",
	},
	{
		"<leader>J",
		function()
			require("treesj").toggle({ split = { recursive = true } })
		end,
		{ silent = true },
		desc = "TreeSJ Toggle (recursive)",
	},
}

return M
