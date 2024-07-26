local M = {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	opts = {},
}

function M.config()
	require("ibl").setup({
		debounce = 100,
		-- indent = { char = "|" },
		whitespace = {
			highlight = { "Whitespace", "NonText" },
			-- highlight = { "Function", "Label" },
			remove_blankline_trail = true,
		},
		scope = {
			enabled = true,
		},
	})
end

return M
