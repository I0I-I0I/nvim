local M = {
	"rcarriga/nvim-notify",
	lazy = false,
}

function M.config()
	require("notify").setup({
		background_colour = "#111111",
		max_width = 100,
		render = "simple",
		stages = "slide",
		timeout = 3000,
		top_down = true,

		icons = {
			DEBUG = " ",
			ERROR = " ",
			INFO = " ",
			TRACE = "✎ ",
			WARN = " ",
		},
	})

	Bind({
		["n"] = {
			["<plugleader>fn"] = {
				"<cmd>Telescope notify theme=ivy<cr>",
				{ silent = true },
				desc = "List of notifications",
			},
		},
	})
end

return M
