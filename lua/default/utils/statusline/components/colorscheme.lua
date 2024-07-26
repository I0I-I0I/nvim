-- Set style
local style = require(Statusline_Constants .. "style")[Styles.colorscheme]
local str = style("ColorschemeColor", { fg = COLORS.colorscheme.fg })

table.insert(Colors_List, function()
	str = style("ColorschemeColor", { fg = COLORS.colorscheme.fg })
end)

-- Component

local function get_colorscheme()
	local colorscheme = vim.g.colors_name
	return STATUSLINE_ICONS.colorscheme .. " " .. (colorscheme or "default")
end

local function update_colorscheme()
	COLORSCHEME = str(get_colorscheme())
end

COLORSCHEME = ""

return update_colorscheme
