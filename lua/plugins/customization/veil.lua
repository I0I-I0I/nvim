local builtin = require("veil.builtin")

local current_day = os.date("%A")

local default = {
	sections = {
		builtin.sections.animated(builtin.headers.frames_days_of_week[current_day], {
			hl = { fg = "#5de4c7" },
		}),
		builtin.sections.buttons({
			{
				icon = "",
				text = "Continue",
				shortcut = "s",
				callback = function()
					vim.cmd("source session.vim")
				end,
			},
			{
				icon = "",
				text = "Open tree",
				shortcut = "t",
				callback = function()
					vim.cmd("Neotree float")
				end,
			},
			{
				icon = "",
				text = "Config",
				shortcut = "i",
				callback = function()
					vim.cmd("Neotree float /home/i0i/.config/nvim/")
				end,
			},
			{
				icon = "",
				text = "Close",
				shortcut = "q",
				callback = function()
					vim.cmd("qa")
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
