-- Basic
require("core.config")
require("core.mappings")

-- Plugins
local custom = "plugins.customization."
local git = "plugins.git."
local lsp = "plugins.lsp."
local move = "plugins.move."
local util = "plugins.util."
local themes = "themes."

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
	{ import = move .. "harpoon" },
	{ import = move .. "tree" },
	{ import = move .. "leap" },

	-- Utils
	{ import = util .. "dropbar" },
	{ import = util .. "surround" },
	{ import = util .. "treesitter" },
	{ import = util .. "autopairs" },
	{ import = util .. "treesj" },
	{ import = util .. "comments" },
	{ import = util .. "wakatime" },
	{ import = util .. "bbye" },
	{ import = util .. "telescope" },

	-- LSP
	{ import = lsp .. "ai" },
	{ import = lsp .. "lspzero" },
	{ import = lsp .. "lspsaga" },
	{ import = lsp .. "cmp" },
	{ import = lsp .. "mason" },
	{ import = lsp .. "formatter" },
	{ import = lsp .. "linter" },
	{ import = lsp .. "fidget" },
	{ import = lsp .. "garbage" },

	-- Git
	{ import = git .. "git" },
}

require("plugins.lazy")

-- Themes
require("themes.config")
