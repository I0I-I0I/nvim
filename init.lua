vim.loader.enable()

-- Basic
require("core.plugins")
require("core.mappings")
require("core.color")
require("core.config")

-- Plugins
-- Move
require("plugins.move.tree")
require("plugins.move.harpoon")
require("plugins.move.telescope")
require("plugins.move.bufferline")
require("plugins.move.hop")
-- LSP
require("plugins.lsp.lsp")
require("plugins.lsp.lsp-colors")
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
-- Auto close
require("plugins.auto_close.autopairs")
require("plugins.auto_close.autotag")
-- Git
require("plugins.git.git")
-- Other
require("plugins.other.treesitter")
require("plugins.other.comments")
require("plugins.other.noice")
require("plugins.other.toggleterm")
require("plugins.other.treejs")
require("plugins.other.veil")
