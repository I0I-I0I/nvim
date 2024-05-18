local function setColor(item, color)
	if color == nil then
		color = { bg = "none" }
	end
	vim.api.nvim_set_hl(0, item, color)
end

function SetColors(colors)
	local group = vim.api.nvim_create_augroup("Colors", {})

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

	autocmd("CmdlineEnter", {
		group = group,
		callback = function()
			for _, item in ipairs(colors.forCmd) do
				setColor(item)
			end
		end,
	})
end
