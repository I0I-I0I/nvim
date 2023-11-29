-- Basic
require("core.plugins")
require("core.mappings")
require("core.color")
require("core.config")
-- NeoVide
if vim.g.neovide then
	require("core.neovide")
end

-- Plugins
-- LSP
require("plugins.lsp.lsp")
require("plugins.lsp.lspsaga")
require("plugins.lsp.mason")
-- CMP
require("plugins.cmp.cmp")
require("plugins.cmp.null-ls")
require("plugins.cmp.lab")
-- AI
-- require("plugins.cmp.ai.tabnine")
-- require("plugins.cmp.ai.codeium")
-- Icons
require("plugins.icons.icons")
require("plugins.icons.lspkind")
-- Git
require("plugins.git.git")
-- Other
require("plugins.other.treesitter")
require("plugins.other.treejs")
require("plugins.other.surround")
-- Customization
require("plugins.customization.noice")
require("plugins.customization.veil")
require("plugins.customization.hlargs")
require("plugins.customization.css-colors")
require("plugins.customization.zenMode")
-- Move
require("plugins.move.leap")
require("plugins.move.tree")
require("plugins.move.harpoon")
require("plugins.move.telescope")
require("plugins.move.bufferline")
require("plugins.move.cybu")
require("plugins.move.bbye")
