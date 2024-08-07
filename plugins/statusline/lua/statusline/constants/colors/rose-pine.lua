local colors = {
	dark_teal = "#31748f",
	white = "#e0def4",
	aqua = "#9ccfd8",
	purple = "#908caa",
	rose = "#d6aeaa",
	yeellow = "#f7bd71",
	lavender = "#c3a9e7",
	indigo = "#26253a",
}

local normal = {
	fg = colors.white,
	bg = "NONE",
}

local island = {
	bg = colors.indigo,
}

local sep = {
	fg = island.bg,
	bg = normal.bg,
}

local mode = {
	fg = colors.rose,
	bg = island.bg,
}

local git_status = {
	master = {
		fg = colors.lavender,
		bg = normal.bg,
	},
}

local path = {
	fg = colors.purple,
	bg = island.bg,
}

local root_path = {
	fg = colors.purple,
	bg = island.bg,
}

local modified = {
	fg = colors.aqua,
	bg = normal.bg,
}

local buffers = {
	fg = colors.yeellow,
	bg = normal.bg,
}

local filesize = {
	fg = colors.dark_teal,
	bg = island.bg,
}

local macro = {
	fg = colors.lavender,
	bg = normal.bg,
}

local count_lines = {
	fg = colors.white,
	bg = normal.bg,
}

local colorscheme = {
	fg = colors.rose,
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
