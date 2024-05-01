local Colorizer = {
	"norcalli/nvim-colorizer.lua",
	event = { "BufRead", "BufNewFile" },
}

function Colorizer.config()
	require("colorizer").setup({
		"*",
	})
end

return Colorizer
