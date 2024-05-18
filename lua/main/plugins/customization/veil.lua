local veil = {
	"willothy/veil.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	lazy = false,
	priority = 1000,
}

function veil.config()
	local builtin = require("veil.builtin")
	local current_day = os.date("%A")

	vim.keymap.set("n", "<leader>o", "<cmd>Bdelete<cr><cmd>OpenVeil<cr>", { silent = true, noremap = true })

	local default = {
		sections = {
			builtin.sections.animated(builtin.headers.frames_days_of_week[current_day], {
				hl = { fg = "#5de4c7" },
			}),
			builtin.sections.buttons({
				{
					icon = "",
					text = "Sessions",
					shortcut = "s",
					callback = function()
						vim.cmd("Sessions")
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
					icon = "",
					text = "Find file",
					shortcut = "f",
					callback = function()
						vim.cmd("Telescope find_files")
					end,
				},
				{
					icon = "",
					text = "Config",
					shortcut = "i",
					callback = function()
						vim.cmd("cd ~/.config/nvim/lua/main")
						vim.cmd("Neotree float")
					end,
				},
				{
					icon = "",
					text = "Close",
					shortcut = "q",
					callback = function()
						vim.cmd([[
                                    quit
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

	-- Create buffer
	vim.keymap.set("n", "<C-w>b", "<cmd>OpenVeil<cr>", { silent = true })

	-- Open veil
	function OpenVeil()
		vim.cmd("set nocursorline")
		vim.cmd("Veil")
	end

	vim.api.nvim_create_user_command("OpenVeil", OpenVeil, {})

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

	function CloseAllWindows(cmd)
		if cmd == "q" then
			vim.cmd([[
                Bdelete
                try
                    close
                catch
                    OpenVeil
                endtry
            ]])
		elseif cmd == "wq" then
			vim.cmd([[
                w
                Bdelete
                try
                    close
                catch
                    OpenVeil
                endtry
            ]])
		elseif cmd == "qa" then
			vim.cmd([[
                bufdo :Bdelete
                tabonly
                only
                OpenVeil
            ]])
		elseif cmd == "wqa" then
			vim.cmd([[
                wa
                tabonly
                only
                try
                    bufdo :Bdelete!
                catch
                    echo "Error :Bdelete"
                endtry
                OpenVeil
            ]])
		elseif cmd == "c" then
			vim.cmd("close")
		end
	end

	vim.cmd([[
        cnoreabbrev q lua CloseAllWindows('q')
        cnoreabbrev Q lua CloseAllWindows('q')

        cnoreabbrev qa lua CloseAllWindows('qa')
        cnoreabbrev Qa lua CloseAllWindows('qa')

        cnoreabbrev wq lua CloseAllWindows('wq')
        cnoreabbrev Wq lua CloseAllWindows('wq')

        cnoreabbrev wqa lua CloseAllWindows('wqa')
        cnoreabbrev Wqa lua CloseAllWindows('wqa')

        cnoreabbrev c lua CloseAllWindows('c')
    ]])
end

return veil
