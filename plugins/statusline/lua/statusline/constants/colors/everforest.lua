local colors = {
	blue_gray = "#232a2e",
	tan = "#d9bb84",
	olive = "#adbd85",
	teal = "#89b9b4",
	lavender = "#ce9cb4",
	green = "#83c092",
	light_tan = "#d2c5ab",
	rose = "#e67e80",
}

local normal = {
	fg = colors.blue_gray,
	bg = "NONE",
}

local island = {
	bg = colors.blue_gray,
}

local mode = {
	fg = colors.olive,
	bg = island.bg,
}

local git_status = {
	master = {
		fg = colors.rose,
		bg = normal.bg,
	},
}

local path = {
	fg = colors.green,
	bg = island.bg,
}

local root_path = {
	fg = colors.rose,
	bg = island.bg,
}

local modified = {
	fg = colors.green,
	bg = normal.bg,
}

local buffers = {
	fg = colors.teal,
	bg = normal.bg,
}

local filesize = {
	fg = colors.light_tan,
	bg = island.bg,
}

local macro = {
	fg = colors.lavender,
	bg = normal.bg,
}

local count_lines = {
	fg = colors.light_tan,
	bg = normal.bg,
}

local colorscheme = {
	fg = colors.olive,
	bg = normal.bg,
}

local sep = {
	fg = island.bg,
	bg = normal.bg,
}

return {
	normal = normal,
	mode = mode,
	git_status = git_status,
	root_path = root_path,
	modified = modified,
	buffers = buffers,
	macro = macro,
	sep = sep,
	island = island,
	colorscheme = colorscheme,
	count_lines = count_lines,
	filesize = filesize,
	path = path,
}
