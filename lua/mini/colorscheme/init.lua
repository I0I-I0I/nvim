local colorschemes = {
	{
		"rose-pine/neovim",
		name = "ColorScheme_rose-pine",
		lazy = false,
		priority = 1000,
		theme_names = {
			"rose-pine",
		},
		config = function()
			require("rose-pine").setup({
				variant = "main", -- auto, main, moon, or dawn
				dark_variant = "main", -- main, moon, or dawn
				dim_inactive_windows = false,
				extend_background_behind_borders = true,
				disable_background = false,
			})
		end,
	},

	{
		"dgox16/oldworld.nvim",
		name = "ColorScheme_oldworld",
		lazy = false,
		priority = 1000,
		theme_names = {
			"oldworld",
		},
	},

	-- {
	-- 	"sainnhe/gruvbox-material",
	-- 	name = "ColorScheme_gruvbox-material",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	theme_names = {
	-- 		"gruvbox-material",
	-- 	},
	-- },

	{
		"olivercederborg/poimandres.nvim",
		name = "ColorScheme_poimandres",
		lazy = false,
		priority = 1000,
		config = function()
			require('poimandres').setup({})
		end,
		theme_names = {
			"poimandres",
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
		vim.cmd.hi("NormalNC guibg=Normal")
	end,
})


autocmd("BufEnter", {
	pattern = "*",
	callback = function()
		vim.cmd.hi("NormalNC guibg=Normal")
	end
})

return colorschemes
