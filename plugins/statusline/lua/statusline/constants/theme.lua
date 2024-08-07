local colors = Statusline_Constants .. "colors."
local icons = Statusline_Constants .. "icons."

local function update_theme()
	if vim.g.colors_name == "everforest" then
		COLORS = require(colors .. "everforest")
		STATUSLINE_ICONS = require(icons .. "everforest")
		return
	elseif vim.g.colors_name == "rose-pine" then
		COLORS = require(colors .. "rose-pine")
		STATUSLINE_ICONS = require(icons .. "rose-pine")
		return
	elseif vim.g.colors_name == "kanagawa" then
		COLORS = require(colors .. "kanagawa")
		STATUSLINE_ICONS = require(icons .. "kanagawa")
		return
	elseif vim.g.colors_name == "horizon" then
		COLORS = require(colors .. "horizon")
		STATUSLINE_ICONS = require(icons .. "horizon")
		return
	elseif vim.g.colors_name == "solarized-osaka" then
		COLORS = require(colors .. "solarized-osaka")
		STATUSLINE_ICONS = require(icons .. "solarized-osaka")
		return
	end

	if COLOR then
		COLORS = require(colors .. "default")
		STATUSLINE_ICONS = require(icons .. "default")
	else
		COLORS = require(colors .. "zen")
		STATUSLINE_ICONS = require(icons .. "zen")
	end
end

update_theme()

return update_theme
