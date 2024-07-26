-- Set style
local style = require(Statusline_Constants .. "style")[Styles.count_lines]
local str = style("CountLinesColor", { fg = COLORS.count_lines.fg })

table.insert(Colors_List, function()
	str = style("CountLinesColor", { fg = COLORS.count_lines.fg })
end)

-- Component

local function get_position()
	local line = vim.fn.line(".")
	local col = vim.fn.charcol(".")
	return string.format("%4d:%-2d", line, col)
end

local function get_progress()
	local cur = vim.fn.line(".")
	local total = vim.fn.line("$")
	if cur == 1 then
		return "Top"
	elseif cur == total then
		return "Bot"
	else
		return string.format("%2d%%%%", math.floor(cur / total * 100))
	end
end

local function get_count_lines()
	local position = get_position()
	local progress = get_progress()

	return position .. STATUSLINE_ICONS.sep .. progress
end

local function update_count_lines()
	COUNT_LINES = str(get_count_lines())
end

COUNT_LINES = ""

return update_count_lines
