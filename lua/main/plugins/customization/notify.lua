local M = {
	"rcarriga/nvim-notify",
	lazy = false,
}

function M.config()
	require("notify").setup({
		background_colour = "#111111",
		max_width = 50,
		render = "compact",
		stages = "slide",
		timeout = 3000,
		top_down = true,

		icons = {
			DEBUG = "",
			ERROR = "",
			INFO = "",
			TRACE = "✎",
			WARN = "",
		},
	})

	Bind({
		["n"] = {
			["<plugleader>fn"] = { "<cmd>Noice telescope<cr>", { silent = true } },
		},
	})
end

return M
