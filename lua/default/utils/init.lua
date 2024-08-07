local utils = "default.utils."

local M = {}

function M.get_visual_selection()
	return require(utils .. "get_visual_selection")()
end

function M.string_to_array()
	return require(utils .. "string_to_array")()
end

return M
