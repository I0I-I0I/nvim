local M = {
	"echasnovski/mini.ai",
	version = false,
}

function M.config()
	require("mini.ai").setup({
		-- How to search for object (first inside current line, then inside
		-- neighborhood). One of 'cover', 'cover_or_next', 'cover_or_prev',
		-- 'cover_or_nearest', 'next', 'previous', 'nearest'.
		search_method = "cover_or_nearest",
	})
end

return M
