Path_to_config = "~/.config/nvim/lua/mini/"
Root = "mini."

local core = Root .. "core."

require(core .. "config")
require(core .. "mappings")
require(core .. "plug")
require(core .. "lsp")

require(Root .. "theme.theme")
