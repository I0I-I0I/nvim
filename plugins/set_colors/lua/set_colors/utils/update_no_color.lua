local M = {}

local function include(value, arr)
	for _, v in ipairs(arr) do
		if v == value then
			return true
		end
	end
	return false
end

M.no_color_themes = {
	"kanagawabones",
	"zenbones",
	"rosebones",
}

function M.update_no_color()
	local colorscheme = vim.g.colors_name

	if include(colorscheme, M.no_color_themes) then
		COLOR = false
	else
		COLOR = true
	end
end

return M.update_no_color
