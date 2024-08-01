local set_color = require(Statusline_Utils .. "set_color")

local function to_color(name, colors)
	local color = set_color(name, { fg = colors.fg, bg = COLORS.normal.bg })
	return function(component)
		return color .. "  " .. component .. "  "
	end
end

return to_color
