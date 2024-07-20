local M = {
	"karb94/neoscroll.nvim",
	event = "VeryLazy",
}

function M.config()
	require("neoscroll").setup({
		mappings = { -- Keys to be mapped to their corresponding default scrolling animation
			"<C-u>",
			"<C-d>",
			"<C-b>",
			"<C-f>",
			"<C-y>",
			"<C-e>",
			"zt",
			"zz",
			"zb",
		},
		hide_cursor = true, -- Hide cursor while scrolling
		stop_eof = true, -- Stop at <EOF> when scrolling downwards
		respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
		cursor_scrolls_alone = false, -- The cursor will keep on scrolling even if the window cannot scroll further
		easing = "linear", -- Default easing function
		performance_mode = false,
	})
end

return M
