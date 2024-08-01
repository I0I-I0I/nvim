local M = {
	"kylechui/nvim-surround",
	version = "*",
	event = "VeryLazy",
}

function M.config()
	require("nvim-surround").setup({
		-- Configuration here, or leave empty to use defaults
	})
end

return M
