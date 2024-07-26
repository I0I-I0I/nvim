Path_to_config = "~/.config/nvim/lua/main/"

local root = "main."
default = "default."
plugins = "main.plugins."
theme = root .. "theme."

-- Basic
require(default .. "config")
require(Utils .. "statusline")
require(default .. "mappings")

-- Plugins
require(plugins .. "lazy")

-- Themes
require(theme .. "colorscheme")
require(theme .. "theme")
