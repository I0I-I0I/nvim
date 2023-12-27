-- Basic
require("core.plugins")
require("core.color")
require("core.mappings")
require("core.config")

-- Plugins
-- LSP
require("plugins.lsp.lsp")
require("plugins.lsp.lspsaga")
require("plugins.lsp.null-ls")
-- CMP
require("plugins.lsp.cmp.cmp")
-- AI
-- require("plugins.lsp.cmp.ai.codeium")
-- require("plugins.lsp.cmp.ai.tabnine")

-- Git
require("plugins.git.git")

-- Other
require("plugins.other.treesitter")
require("plugins.other.treejs")
require("plugins.other.surround")
require("plugins.other.toggleterm")
require("plugins.other.bbye")
require("plugins.other.lab")

-- Customization
require("plugins.customization.noice")
require("plugins.customization.css-colors")
require("plugins.customization.hlargs")
require("plugins.customization.veil")
require("plugins.customization.rainbow")
-- Icons
require("plugins.customization.icons.icons")
require("plugins.customization.icons.lspkind")

-- Move
require("plugins.move.leap")
require("plugins.move.tree")
require("plugins.move.harpoon")
require("plugins.move.telescope")
require("plugins.move.bufferline")
require("plugins.move.cybu")

-- NeoVide
if vim.g.neovide then
	require("core.neovide")
end
