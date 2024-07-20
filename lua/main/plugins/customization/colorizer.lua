local M = {
	"norcalli/nvim-colorizer.lua",
	event = { "BufRead", "BufNewFile" },
}

function M.config()
	require("colorizer").setup({
		"*",
	})
end

return M
