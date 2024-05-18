local root = "main."
-- Basic
local core = root .. "core."
local plugins = "main.plugins."

require(core .. "config")
require(core .. "utils")
require(core .. "mappings")

-- Plugins
local theme = root .. "theme."
local custom = plugins .. "customization."
local move = plugins .. "move."
local util = plugins .. "util."
local lsp = plugins .. "lsp."
local ai = plugins .. "ai."
local git = plugins .. "git."

Plugins = {
	-- Theme
	{ import = theme },

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
	{ import = util .. "wakatime" },
	{ import = util .. "telescope" },
	{ import = util .. "session" },

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

require(plugins .. "lazy")

-- Themes
require(theme .. "colorscheme")

vim.cmd("Color kanagawa 0.8")
