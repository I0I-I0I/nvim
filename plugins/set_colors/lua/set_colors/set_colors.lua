local function set_color(item, color)
	if color == nil then
		color = { bg = "none" }
	end
	vim.api.nvim_set_hl(0, item, color)
end

local function set_colors(colors)
	local group = vim.api.nvim_create_augroup("Colors", {})

	local updateToggleColors = require("set_colors.toggle_colors")

	local newColors = updateToggleColors()

	for _, item in ipairs(newColors) do
		table.insert(colors.withFgBg, item)
	end

	for _, item in ipairs(colors.default) do
		set_color(item)
	end

	for _, value in pairs(colors.withFgBg) do
		set_color(value[1], value[2])
	end

	autocmd("BufEnter", {
		group = group,
		callback = function()
			for _, item in ipairs(colors.forBuf) do
				set_color(item)
			end
			set_color("NeoTreeEndOfBuffer", { fg = "#111111" })
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
				set_color(item)
			end
		end,
	})
end

return set_colors
