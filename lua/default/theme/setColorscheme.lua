require(Theme_utils .. "toggleThemeStyle")
local updateNoColor = require(Theme_utils .. "updateNoColor")

function SetColorscheme(colorscheme, transparent)
	vim.opt.background = "dark"
	vim.cmd.colorscheme(colorscheme)
	updateNoColor()

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
		if colorscheme == "horizon" then
			vim.cmd("hi NonText guifg=#777777")
		end
		return
	end

	if not transparent then
		transparent = 0.7
	end

	local colors = require(Theme .. "colors")
	SetColors(colors)

	if vim.g.neovide then
		vim.g.neovide_transparency = transparent
		vim.cmd("hi! CursorLine guibg=#333333")
	else
		vim.cmd("hi! CursorLine gui=underline cterm=underline guibg=NONE ctermfg=None guifg=None")
	end

	vim.cmd([[
        hi IlluminatedWord gui=underline guibg=none
        hi IlluminatedWordRead gui=underline guibg=none
        hi IlluminatedWordWrite gui=underline guibg=none
        hi IlluminatedWordText gui=underline guibg=none
    ]])
end

function GetColorschemeNames()
	AllColorschemes = {}
	for _, value in pairs(Colorschemes) do
		for _, theme_name in pairs(value.theme_names) do
			table.insert(AllColorschemes, theme_name)
		end
	end
	return AllColorschemes
end

vim.api.nvim_create_user_command("Color", function(input)
	local color = input.fargs[1]
	local transparent = tonumber(input.fargs[2])
	SetColorscheme(color, transparent)
end, {
	nargs = "*",
	complete = function(ArgLead, CmdLine, CursorPos)
		local CmdLineArray = table.getn(string_to_array(CmdLine))
		if CmdLineArray == 1 then
			return GetColorschemeNames()
		end
	end,
})
