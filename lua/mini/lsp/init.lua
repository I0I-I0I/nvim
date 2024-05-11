-- Capabilities
capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Local variables
local lsp = "mini.lsp."
local config = lsp .. "config."
local servers = lsp .. "servers."

-- lsp servers
require(servers .. "pyright")
require(servers .. "tsserver")
require(servers .. "lua_ls")

-- Config
require(config .. "diagnostic")
require(config .. "mappings")
require(config .. "cmp")
require(config .. "linter")
