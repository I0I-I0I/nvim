local function delete_extension(str)
	local result = ""
	for char in string.gmatch(str, "(.-)%.") do
		result = result .. char
	end
	return result
end

return delete_extension
