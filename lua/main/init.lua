local root = "main."
local default_path = "default."
COLORSCHEME_PATH = default_path .. "colorscheme."
PLUGINS_PATH = root .. "plugins."

require(default_path .. "init")
require(PLUGINS_PATH .. "lazy")
require(COLORSCHEME_PATH .. "theme")
