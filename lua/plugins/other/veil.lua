local builtin = require("veil.builtin")

local current_day = os.date("%A")

local default = {
	sections = {
		builtin.sections.animated(builtin.headers.frames_days_of_week[current_day], {
			hl = { fg = "#5de4c7" },
		}),
		builtin.sections.buttons({
			{
				icon = "",
				text = "Open tree",
				shortcut = "t",
				callback = function()
					vim.cmd("Neotree float focus")
				end,
			},
			{
				icon = "",
				text = "Find Files",
				shortcut = "f",
				callback = function()
					require("telescope.builtin").find_files()
				end,
			},
			{
				icon = "",
				text = "Find Word",
				shortcut = "w",
				callback = function()
					require("telescope.builtin").live_grep()
				end,
			},
			{
				icon = "",
				text = "Config",
				shortcut = "i",
				callback = function()
					vim.cmd("Neotree float focus /home/i0i/.config/nvim/")
				end,
			},
		}, { spacing = 5 }),
		builtin.sections.oldfiles(),
	},
	selection = {
		separators = {
			left = "",
			right = "",
		},
	},
	mappings = {},

	startup = true,
	listed = true,
}

require("veil").setup(default)
