local function set_color(item, color)
	vim.api.nvim_set_hl(0, item, color)
	return "%#" .. item .. "#"
end

return set_color
