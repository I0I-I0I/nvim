local function setColor(item, color)
	if color == nil then
		color = { bg = "none" }
	end
	vim.api.nvim_set_hl(0, item, color)
end

function SetColors(colors)
	local group = vim.api.nvim_create_augroup("Colors", {})

	local updateToggleColors = require(Theme .. "toggleColors")

	local newColors = updateToggleColors()

	for _, item in ipairs(newColors) do
		table.insert(colors.withFgBg, item)
	end

	for _, item in ipairs(colors.default) do
		setColor(item)
	end

	for _, value in pairs(colors.withFgBg) do
		setColor(value[1], value[2])
	end

	autocmd("BufEnter", {
		group = group,
		callback = function()
			for _, item in ipairs(colors.forBuf) do
				setColor(item)
			end
			setColor("NeoTreeEndOfBuffer", { fg = "#111111" })
		end,
	})

	vim.cmd([[
		hi! lualine_transitional_lualine_b_insert_to_lualine_c_insert guibg=NONE
		hi! lualine_transitional_lualine_b_normal_to_lualine_c_normal guibg=NONE
		hi! lualine_transitional_lualine_b_visual_to_lualine_c_visual guibg=NONE
		hi! lualine_transitional_lualine_b_command_to_lualine_c_command guibg=NONE
    ]])

	autocmd("CmdlineEnter", {
		group = group,
		callback = function()
			for _, item in ipairs(colors.forCmd) do
				setColor(item)
			end
		end,
	})
end
