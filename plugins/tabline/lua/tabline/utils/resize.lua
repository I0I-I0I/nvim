local function get_nvim_tree_window_size()
	local windows = vim.api.nvim_list_wins()
	for _, win in ipairs(windows) do
		local buf = vim.api.nvim_win_get_buf(win)
		local buf_name = vim.api.nvim_buf_get_name(buf)
		if string.find(buf_name, "NvimTree") then
			return vim.api.nvim_win_get_width(win)
		end
	end
	return 0
end

return get_nvim_tree_window_size
