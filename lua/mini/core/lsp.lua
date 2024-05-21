-- Capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

-- Local variables
local lsp = Root .. "lsp."
local config = lsp .. "config."
local servers = lsp .. "servers."

-- lsp servers
require(servers .. "pyright")

require(servers .. "lua_ls")

require(servers .. "tsserver")
require(servers .. "css-modules")
require(servers .. "emmet")
require(servers .. "html")
require(servers .. "css")

-- Config
require(config .. "mappings")
require(config .. "mason")
require(config .. "cmp")
require(config .. "linter")
require(config .. "formatter")
