local veil = {
	"willothy/veil.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		-- "nvim-telescope/telescope.nvim",
	},
	lazy = false,
	priority = 1000,
}

function veil.config()
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
						vim.cmd([[
                        Edit /mnt/d/code/project/site_car/app/
                        Neotree float
                    ]])
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
	function OpenVeil()
		vim.cmd("set nocursorline")
		vim.cmd("Veil")
	end

	vim.api.nvim_create_user_command("OpenVeil", OpenVeil, {})

	vim.cmd([[
    ab veil OpenVeil
]])

	-- Open Veil after edit
	function Edit(path)
		vim.cmd.edit(path)
		vim.cmd("vsplit")
		vim.cmd("OpenVeil")
		vim.cmd("only")
		vim.cmd("set nocursorline")
	end

	vim.api.nvim_create_user_command("Edit", function(input)
		local path = input.fargs[1]
		Edit(path)
	end, {
		nargs = 1,
		complete = function(ArgLead, CmdLine, CursorPos)
			local projects = {
				"drevo",
				"dtravel",
			}
			local CmdLineArray = table.getn(string_to_array(CmdLine))
			if CmdLineArray == 1 then
				return projects
			end
		end,
	})

	vim.cmd("ab edit Edit")
end

return veil
