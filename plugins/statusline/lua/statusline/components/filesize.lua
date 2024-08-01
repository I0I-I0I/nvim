-- Set style
local style = require(Statusline_Constants .. "style")[Styles.filesize]
local str = style("FilesizeColor", { fg = COLORS.filesize.fg })

table.insert(Colors_List, function()
	str = style("FilesizeColor", { fg = COLORS.filesize.fg })
end)

-- Component

local function get_filesize()
	local bytes = vim.fn.getfsize(vim.fn.expand("%"))
	if bytes <= 0 then
		return STATUSLINE_ICONS.filesize
	end
	local kb = bytes / 1024
	kb = math.floor(kb * 100) / 100
	return STATUSLINE_ICONS.filesize .. " " .. kb .. "KB"
end

local function update_filesize()
	FILESIZE = str(get_filesize())
end

return update_filesize
