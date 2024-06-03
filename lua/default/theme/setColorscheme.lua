function SetColorscheme(colorscheme, transparent)
	require(Theme_utils .. "toggleThemeStyle")
	vim.opt.background = "dark"
	vim.cmd.colorscheme(colorscheme)

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
		elseif colorscheme == "night-owl" then
			vim.cmd([[
                hi NeoTreeNormal guibg=#021727
                hi NeoTreeNormalNC guibg=#021727
                hi NeoTreeEndOfBuffer guibg=#021727
            ]])
		end
		return
	end

	if not transparent then
		transparent = 0.8
	end

	if vim.g.neovide then
		vim.g.neovide_transparency = transparent
	end

	local colors = require(Theme .. "colors")
	SetColors(colors)

	vim.cmd([[
        hi! CursorLine gui=underline cterm=underline guibg=NONE ctermfg=None guifg=None
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
