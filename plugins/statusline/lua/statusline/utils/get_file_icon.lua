local function get_file_icon()
	local status, icons = pcall(require, "nvim-web-devicons")
	if not status then
		return vim.bo.filetype
	end

	local file = vim.fn.expand("%")
	local extansion = vim.fn.expand("%:e")
	local icon, color = icons.get_icon_color(file, extansion, { default = true })

	return icon .. " ", color
end

return get_file_icon
