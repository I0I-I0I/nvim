local M = {
	"echasnovski/mini.ai",
	version = false,
	event = "BufRead",
}

M.opts = {
	-- 'cover', 'cover_or_next', 'cover_or_prev',
	-- 'cover_or_nearest', 'next', 'previous', 'nearest'.
	search_method = "cover_or_nearest",
}

return M
