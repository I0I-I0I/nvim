local function get_last_of_string(str, sep)
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

return get_last_of_string
