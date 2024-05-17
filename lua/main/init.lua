-- Basic
local core = "main.core."

require(core .. "config")
require(core .. "utils")
require(core .. "mappings")

-- Colorscheme
local colorscheme = "everforest" -- kanagawa everforest tokyonight-moon nord

-- Plugins
local custom = "main.plugins.customization."
local git = "main.plugins.git."
local lsp = "main.plugins.lsp."
local move = "main.plugins.move."
local util = "main.plugins.util."
local ai = "main.plugins.ai."
local themes = "main.themes."

Plugins = {
	-- Themes
	{ import = themes .. "colorscheme" },

	-- Customization
	{ import = custom .. "bufferline" },
	{ import = custom .. "blankline" },
	{ import = custom .. "undo" },
	{ import = custom .. "colorizer" },
	{ import = custom .. "hlargs" },
	{ import = custom .. "notify" },
	{ import = custom .. "noice" },
	{ import = custom .. "rainbow-brackets" },
	{ import = custom .. "veil" },
	{ import = custom .. "icons" },
	{ import = custom .. "mini" },

	-- Move
	{ import = move .. "tree" },
	{ import = move .. "leap" },
	{ import = move .. "telescope" },

	-- Utils
	{ import = util .. "surround" },
	{ import = util .. "treesitter" },
	{ import = util .. "autopairs" },
	{ import = util .. "treesj" },
	{ import = util .. "comments" },
	{ import = util .. "bbye" },
	{ import = util .. "illuminate" },
	{ import = util .. "spectre" },
	{ import = util .. "undotree" },
	{ import = util .. "projects" },
	{ import = util .. "wakatime" },

	-- LSP
	{ import = lsp .. "lsp" },
	{ import = lsp .. "cmp" },
	{ import = lsp .. "formatter" },
	{ import = lsp .. "linter" },
	{ import = lsp .. "trouble" },
	{ import = lsp .. "lspsaga" },
	{ import = lsp .. "lsp-lens" },
	{ import = lsp .. "fidget" },
	{ import = lsp .. "garbage" },

	-- AI
	{ import = ai .. "codeium" },

	-- Git
	{ import = git .. "git" },
}

require("main.plugins.lazy")

-- Themes
require("main.themes.colorscheme")
vim.cmd("SetColor " .. colorscheme)
