vim.loader.enable()

-- Basic
require("core.plugins")
require("core.mappings")
require("core.color")
require("core.config")

-- Plugins
-- LSP
require("plugins.lsp.lsp")
require("plugins.lsp.lspsaga")
require("plugins.lsp.mason")
-- CMP
require("plugins.cmp.cmp")
require("plugins.cmp.null-ls")
require("plugins.cmp.trouble")
-- AI
require("plugins.cmp.ai.tabnine")
require("plugins.cmp.ai.codeium")
-- Icons
require("plugins.icons.icons")
require("plugins.icons.lspkind")
-- Git
require("plugins.git.git")
-- Other
require("plugins.other.treesitter")
require("plugins.other.comments")
require("plugins.other.noice")
require("plugins.other.treejs")
require("plugins.other.veil")
require("plugins.other.other")
require("plugins.other.css-colors")
require("plugins.other.surround")
-- Move
require("plugins.move.hop")
require("plugins.move.leap")
require("plugins.move.tree")
require("plugins.move.harpoon")
require("plugins.move.telescope")
require("plugins.move.bufferline")
require("plugins.move.cybu")
require("plugins.move.bbye")
