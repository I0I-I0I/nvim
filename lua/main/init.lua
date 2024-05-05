-- Basic
local core = "main.core."
require(core .. "config")
require(core .. "utils")
require(core .. "mappings")

-- Colorscheme
local colorscheme = "tokyonight-moon" -- "kanagawa", "everforest", "tokyonight-moon", "nord"

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
	{ import = themes .. "colorschemes" },

	-- Customization
	{ import = custom .. "bufferline" },
	{ import = custom .. "blankline" },
	{ import = custom .. "mini" },
	{ import = custom .. "undo" },
	{ import = custom .. "colorizer" },
	{ import = custom .. "hlargs" },
	{ import = custom .. "notify" },
	{ import = custom .. "noice" },
	{ import = custom .. "rainbow-brackets" },
	{ import = custom .. "veil" },
	{ import = custom .. "icons" },

	-- Move
	{ import = move .. "cybu" },
	{ import = move .. "tree" },
	{ import = move .. "leap" },
	-- { import = move .. "harpoon" },

	-- Utils
	{ import = util .. "surround" },
	{ import = util .. "treesitter" },
	{ import = util .. "autopairs" },
	{ import = util .. "treesj" },
	{ import = util .. "comments" },
	{ import = util .. "bbye" },
	{ import = util .. "telescope" },
	{ import = util .. "illuminate" },
	{ import = util .. "spectre" },
	{ import = util .. "wakatime" },

	-- LSP
	{ import = lsp .. "lspzero" },
	{ import = lsp .. "lspsaga" },
	{ import = lsp .. "cmp" },
	{ import = lsp .. "formatter" },
	{ import = lsp .. "linter" },
	{ import = lsp .. "lsp-lens" },
	{ import = lsp .. "fidget" },
	{ import = lsp .. "garbage" },
	{ import = lsp .. "trouble" },

	-- AI
	{ import = ai .. "codeium" },

	-- Git
	{ import = git .. "git" },
}

require("main.plugins.lazy")

-- Themes
require("main.themes.colorschemes")
SetColorscheme(colorscheme)
