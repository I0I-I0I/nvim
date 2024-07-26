local no_color_themes = {
	"kanagawabones",
	"zenbones",
	"rosebones",
}

local function include(value, arr)
	for _, v in ipairs(arr) do
		if v == value then
			return true
		end
	end
	return false
end

local function updateNoColor()
	local colorscheme = vim.g.colors_name

	if include(colorscheme, no_color_themes) then
		COLOR = false
	else
		COLOR = true
	end
end

return updateNoColor
