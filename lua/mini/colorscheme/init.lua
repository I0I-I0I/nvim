local colorschemes = {
	{
		"craftzdog/solarized-osaka.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			transparent = false,
			dim_inactive = true,
			day_brightness = 0.3,
		},
		theme_names = {
			"solarized-osaka",
		},
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = false,
		priority = 1000,
		theme_names = {
			"rose-pine",
		},
		opts = {
			variant = "main", -- auto, main, moon, or dawn
			dark_variant = "main", -- main, moon, or dawn
			dim_inactive_windows = false,
			extend_background_behind_borders = true,
			disable_background = true,
		},
	},
}

local ok, set_colors = pcall(require, "set_colors")

if ok then
	set_colors.add_colorschemes(colorschemes)
end

autocmd("ColorScheme", {
	pattern = "*",
	callback = function()
		vim.cmd.hi("LspInlayHint guibg=NONE guifg=#444444")
	end,
})

return colorschemes
