vim.api.nvim_create_user_command("SetColor", function(input)
	local color = input.fargs[1]
	local transparent = tonumber(input.fargs[2])

	if not transparent then
		transparent = 0.7
	end

	SetColorscheme(color, transparent)

	if input.fargs[3] == "noitalic" then
		vim.cmd("DisableItalic")
	elseif input.fargs[3] then
		print("Italic enable")
	end
end, {
	nargs = "*",
	complete = function(ArgLead, CmdLine, CursorPos)
		local colors = {
			"kanagawa",
			"everforest",
			"tokyonight-moon",
			"nord",
			"catppuccin",
		}

		local CmdLineArray = table.getn(string_to_array(CmdLine))
		if CmdLineArray == 1 then
			return colors
		elseif CmdLineArray == 3 then
			return { "italic", "noitalic" }
		end
	end,
})
