local set_color = require(PathToTabline .. "utils.set_color")

local function get_file_icon(file, extansion)
	local status, icons = pcall(require, "nvim-web-devicons")
	if not status then
		return ""
	end

	local icon, color = icons.get_icon_color(file, extansion, { default = true })

	return icon .. " ", color
end

local function buffer_icon(index)
	local buflist = vim.fn.tabpagebuflist(index)
	local winnr = vim.fn.tabpagewinnr(index)
	local file = vim.fn.bufname(buflist[winnr])
	local icon, color = get_file_icon(file, vim.fn.expand("%:e"))
	local IconColor = set_color("IconColor_" .. vim.fn.expand("%:e"), { fg = color, bg = "NONE" })
	return IconColor .. " " .. icon
end

return buffer_icon
