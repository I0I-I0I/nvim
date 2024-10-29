Styles = {
	mode = "island",
	root_path = "island",
	path = "island",
	filesize = "island",
	paste = "component",
	modified = "component",
	buffers = "component",
	macro = "component",
	colorscheme = "component",
	git = "component",
	count_lines = "component",
}

local function Statusline()
	local components = {
		MODE,
		ROOT_PATH,
		PATH,
		FILESIZE,
		PASTE,
		MODIFIED,
		"%=",
		-- BUFFERS,
		MACRO,
		COLORSCHEME,
		GIT,
		COUNT_LINES,
	}

	return table.concat(components, "")
end

return Statusline
