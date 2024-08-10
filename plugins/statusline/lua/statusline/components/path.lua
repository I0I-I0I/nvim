-- Set style
local set_style = Styles.path
local style = require(Statusline_Constants .. "style")[set_style]
local str = style("PathColor", { fg = COLORS.path.fg })

table.insert(Colors_List, function()
	str = style("PathColor", { fg = COLORS.path.fg })
end)

-- Component

local set_color = require(Statusline_Utils .. "set_color")
local get_last_of_string = require(Statusline_Utils .. "get_last_of_string")
local remove_last_char = require(Statusline_Utils .. "remove_last_char")
local delete_extension = require(Statusline_Utils .. "delete_extension")
local get_file_icon = require(Statusline_Utils .. "get_file_icon")

local function get_filetype()
	local icon, color = get_file_icon()
	local filetype = vim.bo.filetype

	if icon == filetype then
		return "[" .. filetype .. "]"
	elseif not COLOR then
		return icon .. filetype
	else
		local FileIconColor = set_color("FileIconColor", {
			fg = color,
			bg = (set_style == "component") and COLORS.normal.bg or COLORS.island.bg,
		})
		return FileIconColor .. icon .. filetype
	end
end

local function get_path_from_root(dir, root_path)
	local s = ""
	local toggle = false

	for char in string.gmatch(dir, "([^/]+)") do
		if toggle then
			s = s .. char .. "/"
		end
		if char == root_path then
			toggle = true
		end
	end

	return s
end

local function get_path_to_file(full_path, root_path)
	local printed_message = STATUSLINE_ICONS.path
	local workflow_path = get_last_of_string(full_path, "/")

	if workflow_path == root_path then
		return printed_message .. " ./"
	end

	local path_from_workflow = get_path_from_root(full_path, root_path)

	if path_from_workflow == "" then
		return printed_message .. full_path .. "/"
	end

	return printed_message .. path_from_workflow
end

local function get_path()
	local path_to_workflow = vim.fn.system("pwd")
	local root_path = remove_last_char(get_last_of_string(path_to_workflow, "/"))

	local file = vim.fn.expand("%:t")
	local full_path_to_file = vim.fn.expand("%:h")
	local path_to_file = get_path_to_file(full_path_to_file, root_path)

	return path_to_file .. delete_extension(file)
end

local function update_path()
	PATH = str(get_path() .. STATUSLINE_ICONS.sep .. get_filetype())
end

PATH = ""

return update_path
