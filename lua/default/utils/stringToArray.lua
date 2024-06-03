-- String to array
function string_to_array(string)
	local words = {}
	for w in string:gmatch("%w+") do
		table.insert(words, w)
	end
	return words
end
