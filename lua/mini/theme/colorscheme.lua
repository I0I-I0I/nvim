Colorschemes = {
	{
		theme_names = {
			"everforest",
			"OceanicNext",
			"zenbones",
			"kanagawabones",
			"forestbones",
			"tokyobones",
			"rosebones",
			"duckbones",
			"neobones",
		},
	},
}

Theme = "default.theme."
Theme_utils = Theme .. "utils."

require(Theme .. "setColors")
require(Theme .. "setColorscheme")
require(Theme_utils .. "telescope_theme")
