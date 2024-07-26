local colors = {
	red = "#e95678",
	lavender = "#af7fd6",
	orange = "#dd9a43",
	dark_orange = "#cb631e",
	light_orange = "#f4c39e",
	gray = "#4c4d52",
	light_gray = "#b9b9b9",
	teal = "#459eab",
	gold = "#d19936",
	rose = "#e79785",
	dark = "#323232",
}

local normal = {
	fg = colors.blue_gray,
	bg = "NONE",
}

local island = {
	bg = colors.dark,
}

local mode = {
	fg = colors.orange,
	bg = island.bg,
}

local git_status = {
	master = {
		fg = colors.dark_orange,
		bg = normal.bg,
	},
}

local path = {
	fg = colors.lavender,
	bg = island.bg,
}

local root_path = {
	fg = colors.red,
	bg = island.bg,
}

local modified = {
	fg = colors.rose,
	bg = normal.bg,
}

local buffers = {
	fg = colors.teal,
	bg = normal.bg,
}

local filesize = {
	fg = colors.light_gray,
	bg = island.bg,
}

local macro = {
	fg = colors.lavender,
	bg = normal.bg,
}

local count_lines = {
	fg = colors.rose,
	bg = normal.bg,
}

local colorscheme = {
	fg = colors.orange,
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
