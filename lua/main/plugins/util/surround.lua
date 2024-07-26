local M = {
	"kylechui/nvim-surround",
	version = "*",
	event = "BufRead",
}

function M.config()
	require("nvim-surround").setup()
end

return M
