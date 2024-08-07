local M = {
	"stevearc/dressing.nvim",
	event = "VeryLazy",
}

M.opts = {
	select = {
		trim_prompt = true,
		backend = { "builtin", "telescope" },
		builtin = {
			show_numbers = true,
			relative = "win",
			min_height = { 2, 0.05 },
			min_width = { 30, 0.2 },
		},
		telescope = require("telescope.themes").get_cursor(),
	},
}

return M
