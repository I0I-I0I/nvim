local function get_visual_selection()
	local start_pos = vim.fn.getpos("'<")
	local end_pos = vim.fn.getpos("'>")

	local start_line = start_pos[2]
	local start_col = start_pos[3]
	local end_line = end_pos[2]
	local end_col = end_pos[3]

	local lines = vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, false)

	local selected_text = ""
	if start_line == end_line then
		selected_text = string.sub(lines[1], start_col, end_col)
	else
		selected_text = string.sub(lines[1], start_col) .. "\n"
		for i = 2, #lines - 1 do
			selected_text = selected_text .. lines[i] .. "\n"
		end
		selected_text = selected_text .. string.sub(lines[#lines], 1, end_col)
	end

	return selected_text
end

return get_visual_selection
