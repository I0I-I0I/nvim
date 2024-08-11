local update_no_color = require("set_colors.utils.update_no_color")
local set_colors = require("set_colors.set_colors")
local get_colorscheme_names = require("set_colors.utils.get_colorscheme_names").get_colorscheme_names
local set_telescope_colors = require("set_colors.set_telescope_colors")

local function set_colorscheme(colorscheme, transparent)
	vim.opt.background = "dark"
	vim.cmd.colorscheme(colorscheme)
	update_no_color()

	local NormalColor = vim.api.nvim_get_hl_by_name("Normal", true)

	local defaultColors = {
		{ "WinSeparator", { fg = NormalColor.background } },
		{ "Whitespace", { fg = "#333333" } },
	}

	for _, value in ipairs(vim.g.cmp_colors or {}) do
		vim.api.nvim_set_hl(0, value[1], value[2])
	end

	for _, value in ipairs(defaultColors) do
		vim.api.nvim_set_hl(0, value[1], value[2])
	end

    set_telescope_colors(colorscheme)

	if transparent == 1 then
		vim.cmd([[
		          try
		              au! Colors
		          catch
		          endtry
		      ]])
		if vim.g.neovide then
			vim.g.neovide_transparency = 1
		end


		if colorscheme == "rose-pine" then
			vim.cmd.hi("Normal guibg=#151515")
		end
		return
	end


	if not transparent then
		transparent = 0.7
	end

	local colors = require("set_colors.colors")
	set_colors(colors)

	if vim.g.neovide then
		vim.g.neovide_transparency = transparent
	end

	vim.cmd([[
        hi IlluminatedWord gui=underline guibg=none
        hi IlluminatedWordRead gui=underline guibg=none
        hi IlluminatedWordWrite gui=underline guibg=none
        hi IlluminatedWordText gui=underline guibg=none
    ]])
end

vim.api.nvim_create_user_command("SetColor", function(input)
	local color = input.fargs[1]
	local transparent = tonumber(input.fargs[2])
	set_colorscheme(color, transparent)
end, {
	nargs = "*",
	complete = function(ArgLead, CmdLine, CursorPos)
		local CmdLineArray = table.getn(string_to_array(CmdLine))
		if CmdLineArray == 1 then
			return get_colorscheme_names()
		end
	end,
})
