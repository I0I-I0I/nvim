local function bind_buffer(key, list)
	Bind({
		["n"] = {
			["<leader>" .. key] = {
				function()
					vim.cmd("buffer " .. list[key])
				end,
				desc = "Move to buffer " .. key,
			},
		},
	})
end

local function get_buffers()
	local list = {}
	local buffers = vim.fn.execute("ls")
	for file in string.gmatch(buffers, '"(.-)"') do
		table.insert(list, file)
	end

	for i = 1, 9 do
		bind_buffer(i, list)
	end
end

autocmd({ "BufAdd", "BufDelete", "BufHidden", "TabEnter" }, {
	callback = get_buffers,
})
