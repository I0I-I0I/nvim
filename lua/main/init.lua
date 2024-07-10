Path_to_config = "~/.config/nvim/lua/main/"
local root = "main."

-- Basic
local default = "default."
local plugins = "main.plugins."

require(default .. "config")
require(default .. "mappings")

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
	{ import = theme .. "colorscheme" },

	-- Customization
	{ import = custom .. "animation" },
	{ import = custom .. "blankline" },
	{ import = custom .. "bufferline" },
	{ import = custom .. "undo" },
	{ import = custom .. "notify" },
	{ import = custom .. "noice" },
	{ import = custom .. "rainbow-brackets" },
	{ import = custom .. "veil" },
	{ import = custom .. "icons" },

	-- Move
	{ import = move .. "tree" },

	-- Utils
	{ import = util .. "surround" },
	{ import = util .. "treesitter" },
	{ import = util .. "autopairs" },
	{ import = util .. "treesj" },
	{ import = util .. "comments" },
	{ import = util .. "bbye" },
	{ import = util .. "illuminate" },
	{ import = util .. "undotree" },
	{ import = util .. "telescope" },
	{ import = util .. "session" },
	{ import = util .. "quick-scope" },
	{ import = util .. "wakatime" },
	{ import = util .. "neotest" },

	-- LSP
	{ import = lsp .. "lsp" },
	{ import = lsp .. "cmp" },
	{ import = lsp .. "formatter" },
	{ import = lsp .. "linter" },
	{ import = lsp .. "lspsaga" },
	{ import = lsp .. "garbage" },
	{ import = lsp .. "lsp-lens" },
	{ import = lsp .. "fidget" },
	{ import = lsp .. "trouble" },

	-- AI
	-- { import = ai .. "codeium" },

	-- Git
	{ import = git .. "git" },
}

-- if not vim.g.neovide then
-- 	table.insert(Plugins, { import = custom .. "pets" })
-- end

require(plugins .. "lazy")

-- Themes
require(theme .. "colorscheme")

require(theme .. "theme")
