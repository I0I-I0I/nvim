local count_lines = ""
local buffers = ""

local function getCountBuffers()
	local buffers_all = vim.fn.execute("ls")
	local count = 0
	local result = {}
	for file in string.gmatch(buffers_all, '"(.-)"') do
		local buffer = vim.fn.bufnr(file)
		count = count + 1
		table.insert(result, buffer)
	end
	return { buffers = result, count = count }
end

local function printed_buffers()
	local printedBuffers = ""
	local countBuffers = getCountBuffers()

	for k, v in pairs(countBuffers.buffers) do
		if v == vim.fn.bufnr("%") then
			printedBuffers = printedBuffers .. "[" .. k .. "]"
		else
			printedBuffers = printedBuffers .. " " .. k .. " "
		end
	end

	return printedBuffers
end

local function update_buffers()
	buffers = printed_buffers()
end

-- Component

local function get_position()
	local line = vim.fn.line(".")
	local col = vim.fn.charcol(".")
	return string.format("%4d:%-2d", line, col)
end

local function get_progress()
	local cur = vim.fn.line(".")
	local total = vim.fn.line("$")
	if cur == 1 then
		return "Top"
	elseif cur == total then
		return "Bot"
	else
		return string.format("%2d%%%%", math.floor(cur / total * 100))
	end
end

local function get_count_lines()
	local position = get_position()
	local progress = get_progress()

	return position .. " | " .. progress
end

local function update_count_lines()
	count_lines = get_count_lines()
end

local function create_status_line()
	vim.opt.statusline = " "
		.. "%f"
		.. " %y"
		.. " %m"
		.. "%="
		.. buffers
		.. "                       "
		.. count_lines
		.. " "
end

autocmd("CursorMoved", {
	pattern = "*",
	callback = function()
		update_count_lines()
		create_status_line()
	end,
})

autocmd("BufEnter", {
	pattern = "*",
	callback = function()
		update_buffers()
		create_status_line()
	end,
})

autocmd({ "BufDelete" }, {
	pattern = "*",
	callback = function()
		vim.defer_fn(function()
			update_buffers()
			create_status_line()
		end, 50)
	end,
})

autocmd("VimEnter", {
	callback = function()
		create_status_line()
	end,
})
