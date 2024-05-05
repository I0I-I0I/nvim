capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Local variables
local lsp = "mini.lsp."
local config = lsp .. "config."
local server = lsp .. "servers."

-- Server connection
require(server .. "lua_ls")
require(server .. "tsserver")
require(server .. "pyright")

-- Config
require(config .. "diagnostic")
require(config .. "mappings")
require(config .. "cmp")
