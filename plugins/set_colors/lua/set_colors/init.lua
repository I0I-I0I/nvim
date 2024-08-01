local M = {}

local update_colorschemes = require("set_colors.utils.get_colorscheme_names").update_colorschemes

require("set_colors.set_colors")
require("set_colors.set_colorscheme")
local change_theme = require("set_colors.change_theme")

function M.add_colorschemes(colorschemes)
	update_colorschemes(colorschemes)
end

function M.toggle_theme_style()
	require("set_colors.utils.toggle_theme_style")
end

function M.change_colorscheme(transparency)
	change_theme.run(transparency)
end

return M
