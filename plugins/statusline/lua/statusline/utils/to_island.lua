local set_color = require(Statusline_Utils .. "set_color")

local function to_island(name, colors)
	local color = set_color(name, { fg = colors.fg, bg = COLORS.island.bg })
	local NormalColor = set_color("NormalColor", { bg = COLORS.normal.bg, fg = COLORS.normal.fg })
	local SepColor = set_color("SepColor", { fg = COLORS.sep.fg, bg = COLORS.sep.bg })
	local sep_left = SepColor .. " "
	local sep_right = SepColor .. " " .. NormalColor

	return function(component)
		SepColor = set_color("SepColor", { fg = COLORS.sep.fg, bg = COLORS.sep.bg })
		return sep_left .. color .. component .. sep_right
	end
end

return to_island
