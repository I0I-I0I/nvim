local blankline = {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	event = { "BufRead", "BufNewFile" },
	lazy = true,
	opts = {
		indent = {
			char = "│",
			tab_char = "│",
		},
		scope = { show_start = false, show_end = false },
		exclude = {
			filetypes = {
				"help",
				"alpha",
				"dashboard",
				"neo-tree",
				"Trouble",
				"trouble",
				"lazy",
				"mason",
				"notify",
				"toggleterm",
				"lazyterm",
			},
		},
	},
}

function blankline.config()
	require("ibl").setup()
end

return blankline
