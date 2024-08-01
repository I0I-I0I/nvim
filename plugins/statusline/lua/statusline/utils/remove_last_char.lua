local function remove_last_char(str)
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

return remove_last_char
