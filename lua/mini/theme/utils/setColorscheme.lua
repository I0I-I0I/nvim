function SetColorscheme(colorscheme, transparent)
	local colors = require(Theme_utils .. "colors")
	vim.opt.background = "dark"
	vim.cmd.colorscheme(colorscheme)

	vim.cmd([[
        hi! CursorLine gui=underline cterm=underline guibg=NONE ctermfg=None guifg=None
        hi IlluminatedWord gui=underline guibg=none
        hi IlluminatedWordRead gui=underline guibg=none
        hi IlluminatedWordWrite gui=underline guibg=none
        hi IlluminatedWordText gui=underline guibg=none
    ]])

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
		return
	elseif not transparent then
		transparent = 0.8
	end

	if vim.g.neovide then
		vim.g.neovide_transparency = transparent
	end

	SetColors(colors)
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
