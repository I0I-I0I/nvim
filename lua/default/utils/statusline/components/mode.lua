-- Set style
local style = require(Statusline_Constants .. "style")[Styles.mode]
local str = style("DevilColor", { fg = COLORS.mode.fg })

table.insert(Colors_List, function()
	str = style("DevilColor", { fg = COLORS.mode.fg })
end)

-- Component

local function get_mode()
	local mode = vim.fn.mode()
	if mode ~= "" then
		mode = " " .. mode
	end
	return string.upper(mode)
end

local function update_mode()
	MODE = str(STATUSLINE_ICONS.mode .. get_mode())
end

MODE = ""

return update_mode
