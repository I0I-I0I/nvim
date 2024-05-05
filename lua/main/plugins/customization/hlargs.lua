local hlargs = {
	"m-demare/hlargs.nvim",
	event = { "BufRead", "BufNewFile" },
	lazy = true,
}

function hlargs.config()
	require("hlargs").setup()
end

return hlargs
