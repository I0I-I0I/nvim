-- String to array
local function string_to_array(string)
	local words = {}
	for w in string:gmatch("%w+") do
		table.insert(words, w)
	end
	return words
end

return string_to_array
