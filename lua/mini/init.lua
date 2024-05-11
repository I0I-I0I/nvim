local root = "mini."
local core = root .. "core."

-- Default
require(core .. "config")
require(core .. "mappings")

-- Plugins
require(root .. "plugins")
require(root .. "lsp")

vim.cmd("colorscheme tokyonight-moon")
