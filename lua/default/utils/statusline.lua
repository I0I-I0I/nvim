local function git_branch()
	local branch = vim.fn.system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
	if string.len(branch) > 0 then
		return branch
	else
		return ":"
	end
end

local function getLastOfString(str, sep)
	local s = ""

	for char in string.gmatch(str, "(.)") do
		if char == sep then
			s = ""
		else
			s = s .. char
		end
	end

	return s
end

local function removeLastChar(str)
	local count = 0
	local result = ""
	for value in string.gmatch(str, "(.)") do
		count = count + 1
		result = result .. value
		if count + 1 == string.len(str) then
			return result
		end
	end
end

local function getPathToFile(str, sep)
	local s = ""
	local toggle = false

	for char in string.gmatch(str, "([^/]+)") do
		if toggle then
			s = s .. char .. "/"
		end

		if char == sep then
			toggle = true
		end
	end

	local head = vim.fn.expand("%:h")
	local lastPathHead = getLastOfString(head, "/")
	local template = "Root path: " .. sep .. "  ┃  Current file - "

	if head == "." or lastPathHead == sep then
		template = template .. "./"
	elseif s == "" then
		template = template .. "./" .. head .. "/"
	elseif s == "" and string.gmatch(head, "(.)")() == "/" then
		template = template .. head .. "/"
	else
		template = template .. "./" .. s
	end

	return template
end

function Statusline()
	local set_color = "%#StatusLine#"
	local branch = git_branch()
	local space = " "
	local file_name = " %t"
	local path_to_file = " ┃  "
		.. getPathToFile(
			vim.fn.system("pwd") .. vim.fn.expand("%:h"),
			removeLastChar(getLastOfString(vim.fn.system("pwd"), "/"))
		)
		.. vim.fn.expand("%:t")
		.. "  ┃ "
	local modified = "%m"
	local paste = " %{&paste?'[paste] ':''}"
	local align_right = "%="
	local fileencoding = " %{&fileencoding?&fileencoding:&encoding}"
	local fileformat = " [%{&fileformat}]"
	local linecol = " %l:%c "
	local filetype = " %y"

	return string.format(
		"%s %s %s%s%s%s%s%s%s",
		set_color,
		branch,
		set_color,
		path_to_file,
		filetype,
		modified,
		paste,
		align_right,
		linecol
	)
end
