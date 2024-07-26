-- Set style
local style = require(Statusline_Constants .. "style")[Styles.macro]
local str = style("MacroColor", { fg = COLORS.macro.fg })

table.insert(Colors_List, function()
	str = style("MacroColor", { fg = COLORS.macro.fg })
end)

-- Component

local default_value = string.format("%21s", "")

local function check_macro_recording()
	if vim.fn.reg_recording() ~= "" then
		return STATUSLINE_ICONS.macro .. " Recording @" .. vim.fn.reg_recording()
	end
	return ""
end

local function update_macro(status)
	return function()
		MACRO = status and str(string.format("%1s%s%1s", "", check_macro_recording(), "")) or default_value
	end
end

MACRO = default_value

return update_macro
