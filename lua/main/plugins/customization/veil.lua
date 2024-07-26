local M = {
	"willothy/veil.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	lazy = false,
	priority = 1000,
}

function M.config()
	local builtin = require("veil.builtin")
	local current_day = os.date("%A")

	Bind({
		["n"] = {
			["<plugleader>o"] = { "<cmd>OpenVeil<cr>", { silent = true, noremap = true } },
		},
	})

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
						vim.cmd("NvimTreeOpen .")
						vim.cmd("only")
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
						vim.cmd("NvimTreeOpen .")
						vim.cmd("only")
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

	-- Open veil
	function OpenVeil()
		vim.cmd("Bdelete")
		vim.cmd("NvimTreeClose")
		vim.cmd("set nocursorline")
		vim.cmd("bufdo :Bdelete")
		vim.cmd("Veil")
	end

	vim.api.nvim_create_user_command("OpenVeil", OpenVeil, {})

	autocmd("BufEnter", {
		pattern = "*",
		callback = function()
			if vim.bo.filetype == "veil" then
				vim.opt.laststatus = 0
			else
				vim.opt.laststatus = 3
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
                w!
                Bdelete
                try
                    close
                catch
                    OpenVeil
                endtry
            ]])
		elseif cmd == "qa" then
			vim.cmd([[
                tabonly
                only
                bufdo :Bdelete
                OpenVeil
            ]])
		elseif cmd == "wqa" then
			vim.cmd("NvimTreeClose")
			vim.cmd([[
                wa!
                tabonly
                only
                bufdo :Bdelete
                OpenVeil
            ]])
		elseif cmd == "c" then
			vim.cmd("close")
		elseif cmd == "C" then
			vim.cmd("Bdelete!")
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

        cnoreabbrev c close
        
        cnoreabbrev C 
    ]])
end

return M
