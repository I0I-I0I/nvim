Path_to_config = "~/.config/nvim/lua/mini/"
Root = "mini."

local core = Root .. "core."
local theme = Root .. "theme."

require(core .. "config")
require(core .. "mappings")
require(core .. "plug")
require(core .. "lsp")

-- Current colorscheme
require(theme .. "theme")
