-- Capabilities
-- capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Local variables
local lsp = Root .. "lsp."
local config = lsp .. "config."
local servers = lsp .. "servers."

-- lsp servers
-- Python
require(servers .. "pyright")

-- Lua
require(servers .. "lua_ls")

-- HTML/CSS
require(servers .. "emmet")
require(servers .. "html")
require(servers .. "css")

-- JS
require(servers .. "tsserver")
require(servers .. "css-modules")

-- Config
require(config .. "mappings")
require(config .. "mason")
require(config .. "formatter")
require(config .. "completion")
