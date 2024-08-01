local M = {}

function M.update_colorschemes(colorschemes)
	M.colorschemes = colorschemes
end

function M.get_colorscheme_names()
	AllColorschemes = {}
	for _, value in pairs(M.colorschemes) do
		for _, theme_name in pairs(value.theme_names) do
			table.insert(AllColorschemes, theme_name)
		end
	end
	return AllColorschemes
end

return M
