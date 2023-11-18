local bufferline = require("bufferline")

bufferline.setup({
	options = {
		mode = "tabs",
		always_show_bufferline = false,
		show_buffer_close_icons = false,
		show_close_icon = false,
		color_icons = true,
		offsets = {
			{
				filetype = "neo-tree",
				text = "File Explorer",
				text_align = "right",
				padding = 0,
				separator = true,
			},
		},
		separator_style = "thin",
		style_preset = bufferline.style_preset.minimal, -- or bufferline.style_preset.minimal,
		indicator = {
			icon = "",
			style = "none",
		},
	},
})
