function SetBgColor(bgColor)
	vim.cmd("hi Normal guibg=" .. bgColor)
	vim.cmd("hi NormalNC guibg=" .. bgColor)
	vim.cmd("hi EndOfBuffer guibg=" .. bgColor .. " guifg=" .. bgColor)
	vim.cmd("hi TabLineFill guibg=" .. bgColor)
	vim.cmd("hi LineNrAbove guibg=" .. bgColor .. " guifg=#444444")
	vim.cmd("hi LineNrBelow guibg=" .. bgColor .. " guifg=#444444")
	vim.cmd("hi LineNr guibg=" .. bgColor .. " guifg=#eeeeee")
	vim.cmd("hi SignColumn guibg=" .. bgColor .. " guifg=#eeeeee")

	vim.cmd([[
        highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
        highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
    ]])
end

vim.api.nvim_create_user_command("SetColor", function(input)
	local color = input.fargs[1]
	local mode = tonumber(input.fargs[2])

	vim.cmd.colorscheme(color)

	local bgColor = "#000001"
	if mode == 0 then
		bgColor = "NONE"
	end

	SetBgColor(bgColor)
end, {
	nargs = "*",
	complete = function()
		return {
			"everforest",
			"gruvbox",
			"OceanicNext",
		}
	end,
})
