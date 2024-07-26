local colors = {
	indigo = "#2a2a36",
	tan = "#dcd6bc",
	purple = "#8e7ab0",
	blue_gray = "#698593",
	blue = "#7e9cd8",
	aqua = "#86b3c8",
	dark_aqua = "#82a69f",
	red = "#f16963",
	green = "#9fb874",
	dark_green = "#71938a",
	lavender = "#918ba7",
	light_yellow = "#e3c38a",
	brown = "#bea373",
	orange = "#ffa066",
}

local normal = {
	fg = colors.blue_gray,
	bg = "NONE",
}

local island = {
	bg = colors.indigo,
}

local mode = {
	fg = colors.purple,
	bg = island.bg,
}

local git_status = {
	master = {
		fg = colors.red,
		bg = normal.bg,
	},
}

local path = {
	fg = colors.aqua,
	bg = island.bg,
}

local root_path = {
	fg = colors.blue,
	bg = island.bg,
}

local modified = {
	fg = colors.green,
	bg = normal.bg,
}

local buffers = {
	fg = colors.orange,
	bg = normal.bg,
}

local filesize = {
	fg = colors.light_yellow,
	bg = island.bg,
}

local macro = {
	fg = colors.lavender,
	bg = normal.bg,
}

local count_lines = {
	fg = colors.dark_green,
	bg = normal.bg,
}

local colorscheme = {
	fg = colors.purple,
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
