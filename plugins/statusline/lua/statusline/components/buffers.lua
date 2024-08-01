-- Set style
local style = require(Statusline_Constants .. "style")[Styles.buffers]
local str = style("BuffersColor", { fg = COLORS.buffers.fg })

table.insert(Colors_List, function()
	str = style("BuffersColor", { fg = COLORS.buffers.fg })
end)

-- Component

local function getCountBuffers()
	local buffers = vim.fn.execute("ls")
	local count = 0
	local result = {}
	for file in string.gmatch(buffers, '"(.-)"') do
		local buffer = vim.fn.bufnr(file)
		count = count + 1
		table.insert(result, buffer)
	end
	return { buffers = result, count = count }
end

local function printed_buffers()
	local printedBuffers = STATUSLINE_ICONS.buffers
	local countBuffers = getCountBuffers()

	for k, v in pairs(countBuffers.buffers) do
		if v == vim.fn.bufnr("%") then
			printedBuffers = printedBuffers .. "[" .. k .. "]"
		else
			printedBuffers = printedBuffers .. " " .. k .. " "
		end
	end

	return printedBuffers
end

local function update_buffers()
	BUFFERS = str(printed_buffers())
end

BUFFERS = ""

return update_buffers
