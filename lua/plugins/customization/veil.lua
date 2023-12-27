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
					vim.cmd("Telescope projects")
				end,
			},
			{
				icon = "",
				text = "Open tree",
				shortcut = "t",
				callback = function()
					GoToRootPath()
				end,
			},
			{
				icon = "",
				text = "Config",
				shortcut = "i",
				callback = function()
					vim.cmd("Neotree float $HOME/.config/nvim/")
				end,
			},
			{
				icon = "",
				text = "Close",
				shortcut = "q",
				callback = function()
					vim.cmd([[
                        try
                            close
                        catch
                            quit
                        endtry
                    ]])
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

-- Map tab
vim.keymap.set("n", "<C-w>t", "<cmd>tabnew<cr><cmd>OpenVeil<cr>", { silent = true })

-- Function
function GoToRootPath()
	vim.cmd("Neotree float")
end

function OpenVeil()
	vim.cmd("set nocursorline")
	vim.cmd("Veil")
end

vim.api.nvim_create_user_command("OpenVeil", OpenVeil, {})

vim.cmd([[
    ab veil OpenVeil
]])
