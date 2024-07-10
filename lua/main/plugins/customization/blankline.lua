local indentscope = {
	"echasnovski/mini.indentscope",
	version = "*",
}

function indentscope.config()
	require("mini.indentscope").setup({
		symbol = "┃",
	})
end

return indentscope
