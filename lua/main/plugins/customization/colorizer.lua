local M = {
	"brenoprata10/nvim-highlight-colors",
	event = { "BufRead", "BufNewFile" },
}

function M.config()
	require("nvim-highlight-colors").setup({
		---@usage 'background'|'foreground'|'virtual'
		render = "foreground",

		enable_tailwind = false,
	})
end

return M
