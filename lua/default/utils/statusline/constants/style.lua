local to_island = require(Statusline_Utils .. "to_island")
local to_color = require(Statusline_Utils .. "to_color")

local to = {
	island = to_island,
	component = to_color,
}

return to
