local normal = {
	fg = "#979fa4",
	bg = "NONE",
}

local island = {
	bg = "#323232",
}

local mode = {
	fg = "#ffffff",
	bg = island.bg,
}

local git_status = {
	master = {
		fg = normal.fg,
		bg = normal.bg,
	},
}

local path = {
	fg = normal.fg,
	bg = island.bg,
}

local root_path = {
	fg = normal.fg,
	bg = island.bg,
}

local modified = {
	fg = "#92a86b",
	bg = normal.bg,
}

local buffers = {
	fg = normal.fg,
	bg = normal.bg,
}

local filesize = {
	fg = normal.fg,
	bg = island.bg,
}

local macro = {
	fg = "#5f1b27",
	bg = normal.bg,
}

local count_lines = {
	fg = "#9a9a9a",
	bg = normal.bg,
}

local colorscheme = {
	fg = "#708f8a",
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
	filesize = filesize,
	count_lines = count_lines,
	path = path,
}
