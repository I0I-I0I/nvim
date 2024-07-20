local M = {
	"echasnovski/mini.indentscope",
	version = "*",
}

function M.config()
	require("mini.indentscope").setup({
		symbol = "┃",
	})
end

return M
