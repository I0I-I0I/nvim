-- Set style
local style = require(Statusline_Constants .. "style")[Styles.modified]
local str = style("ModifiedColor", { fg = COLORS.modified.fg })

table.insert(Colors_List, function()
	str = style("ModifiedColor", { fg = COLORS.modified.fg })
end)

-- Component

local function update_modified()
	MODIFIED = vim.bo.modified and str(STATUSLINE_ICONS.modified) or ""
end

MODIFIED = ""

return update_modified
