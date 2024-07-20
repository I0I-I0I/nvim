local M = {
	"m-demare/hlargs.nvim",
	event = "BufRead",
}

function M.config()
	require("hlargs").setup()
end

return M
