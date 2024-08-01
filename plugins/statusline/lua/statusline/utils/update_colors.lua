Colors_List = {}

local function update_colors()
	for _, fn in pairs(Colors_List) do
		fn()
	end
end

return update_colors
