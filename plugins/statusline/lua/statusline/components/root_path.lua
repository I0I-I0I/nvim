-- Set style
local style = require(Statusline_Constants .. "style")[Styles.root_path]
local str = style("RootPathColor", { fg = COLORS.root_path.fg })

table.insert(Colors_List, function()
	str = style("RootPathColor", { fg = COLORS.root_path.fg })
end)

-- Component

local function get_root_path_str(path, sep)
	local root_path = ""
	local regex = "[a-zA-Z0-9_-.]+"
	for char in path:gmatch("(" .. sep .. regex .. ")") do
		root_path = char
	end
	return root_path:match(regex)
end

local function get_root_path()
	local path_to_root = vim.fn.system("pwd")
	local root_path = get_root_path_str(path_to_root, "/")
	return STATUSLINE_ICONS.root_path .. root_path
end

local function update_root_path()
	ROOT_PATH = str(get_root_path())
end

ROOT_PATH = ""

return update_root_path
