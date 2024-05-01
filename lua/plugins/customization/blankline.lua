local blankline = {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	event = { "BufRead", "BufNewFile" },
	lazy = true,
	opts = {},
}

function blankline.config()
	require("ibl").setup()
end

return blankline
