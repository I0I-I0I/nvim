local normal = {
	fg = "#dddddd",
	bg = "NONE",
}

local island = {
	bg = "#2a2a36",
}

local mode = {
	fg = "#db3c26",
	bg = island.bg,
}

local git_status = {
	master = {
		fg = "#d97076",
		bg = normal.bg,
	},
}

local path = {
	fg = "#7f9dd4",
	bg = island.bg,
}

local root_path = {
	fg = "#7f9dd4",
	bg = island.bg,
}

local modified = {
	fg = "#92a86b",
	bg = normal.bg,
}

local buffers = {
	fg = "#31a097",
	bg = normal.bg,
}

local filesize = {
	fg = "#9a9a9a",
	bg = island.bg,
}

local macro = {
	fg = "#db3c26",
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
	count_lines = count_lines,
	filesize = filesize,
	path = path,
}
