Statusline = "statusline."
Statusline_Components = Statusline .. "components."
Statusline_Utils = Statusline .. "utils."
Statusline_Constants = Statusline .. "constants."

local statusline = require(Statusline .. "statusline")

-- Updaters
local update_theme = require(Statusline_Constants .. "theme")
local update_colors = require(Statusline_Utils .. "update_colors")

-- Components updaters
local updaters = {
	update_buffers = require(Statusline_Components .. "buffers"),
	update_git = require(Statusline_Components .. "git"),
	update_macro = require(Statusline_Components .. "macro"),
	update_modified = require(Statusline_Components .. "modified"),
	update_path = require(Statusline_Components .. "path"),
	update_root_path = require(Statusline_Components .. "root_path"),
	update_count_lines = require(Statusline_Components .. "count_lines"),
	update_mode = require(Statusline_Components .. "mode"),
	update_colorscheme = require(Statusline_Components .. "colorscheme"),
	update_filesize = require(Statusline_Components .. "filesize"),
	update_paste = require(Statusline_Components .. "paste"),
}

-- Status line
local function reload_status_line()
	vim.opt.statusline = statusline()
end

local function full_reload_statusline()
	for _, update in pairs(updaters) do
		update()
	end
	reload_status_line()
end

vim.api.nvim_create_user_command("ReloadStatusLine", full_reload_statusline, {})

-- Reload components
local add_listener = require(Statusline_Utils .. "add_listener")(reload_status_line)

add_listener("*.*", "CursorMoved", { updaters.update_count_lines })
add_listener("*.*", "BufEnter", { updaters.update_buffers, updaters.update_path, updaters.update_filesize })
add_listener("*.*", { "BufLeave", "BufDelete" }, { updaters.update_buffers }, 50)
add_listener("*.*", { "BufModifiedSet", "BufEnter" }, { updaters.update_modified })
add_listener("*.*", "RecordingEnter", { updaters.update_macro(true) })
add_listener("*.*", "RecordingLeave", { updaters.update_macro(false) })
add_listener("*", "ModeChanged", { updaters.update_mode })
add_listener("*", "DirChanged", { updaters.update_root_path, updaters.update_git })
add_listener("*", "ColorScheme", { update_theme, update_colors, full_reload_statusline }, 50)

-- On startup
full_reload_statusline()
