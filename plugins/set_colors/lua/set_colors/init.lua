local M = {}

function M.add_colorschemes(colorschemes)
	local update_colorschemes = require("set_colors.utils.get_colorscheme_names").update_colorschemes
	update_colorschemes(colorschemes)
end

M.setup = function()
	require("set_colors.set_custom_colors")
	require("set_colors.set_colorscheme")
	local change_theme = require("set_colors.change_theme")

	function M.toggle_theme_style()
		require("set_colors.utils.toggle_theme_style")
	end

	function M.change_colorscheme(transparency)
		change_theme.run(transparency)
	end
end

return M
