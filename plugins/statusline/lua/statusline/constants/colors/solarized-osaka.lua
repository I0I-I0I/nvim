local colors = {
	dark = "#0a2a35",
	black = "#001419",
	blue = "#268bd3",
	orange = "#c94c16",
	dark_teal = "#27847e",
	blue_gray = "#5b6d74",
	dark_green = "#849900",
	light_gray = "#aeb8b8",
	red = "#d04231",
	lime = "#c9f648",
	cyan = "#2b6165",
    gold = "#b18924",
}

local normal = {
	fg = colors.blue_gray,
	bg = "NONE",
}

local island = {
	bg = colors.dark,
}

local mode = {
	fg = colors.dark_green,
	bg = island.bg,
}

local git_status = {
	master = {
		fg = colors.orange,
		bg = normal.bg,
	},
}

local path = {
	fg = colors.blue,
	bg = island.bg,
}

local root_path = {
	fg = colors.blue,
	bg = island.bg,
}

local modified = {
	fg = colors.lime,
	bg = normal.bg,
}

local buffers = {
	fg = colors.gold,
	bg = normal.bg,
}

local filesize = {
	fg = colors.blue_gray,
	bg = island.bg,
}

local macro = {
	fg = colors.red,
	bg = normal.bg,
}

local count_lines = {
	fg = colors.cyan,
	bg = normal.bg,
}

local colorscheme = {
	fg = colors.dark_green,
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
