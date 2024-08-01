local default_path = "default."
local root_path = "mini."
local custom_path = root_path .. "custom."
COLORSCHEME_PATH = default_path .. "colorscheme"
PLUGINS_PATH = root_path .. "plugins."
LSP_PATH = PLUGINS_PATH .. "lsp."

-- Default
require(default_path .. "init")

-- Plugins/LSP
require(PLUGINS_PATH .. "lazy")
require(LSP_PATH .. "lsp")

-- Custom
require(custom_path .. "config")

-- Current color scheme
require(COLORSCHEME_PATH .. ".theme")
