-- Plugins
local custom = PLUGINS_PATH .. "customization."
local move = PLUGINS_PATH .. "move."
local util = PLUGINS_PATH .. "util."
local lsp = PLUGINS_PATH .. "lsp."
local git = PLUGINS_PATH .. "git."
local other = PLUGINS_PATH .. "other."
local integration = PLUGINS_PATH .. "integration."
local local_plugins = vim.fn.stdpath("config") .. "/plugins/"

local plugins = {
	-- Customization
	{ import = custom .. "indentline" },
	{ import = custom .. "bufferline" },
	{ import = custom .. "undo" },
	{ import = custom .. "notify" },
	{ import = custom .. "noice" },
	{ import = custom .. "veil" },
	{ import = custom .. "icons" },
	{ import = custom .. "colorizer" },

	-- Move
	{ import = move .. "nvim-tree" },
	{ import = move .. "spider" },
	{ import = move .. "multicursors" },
	{ import = move .. "quick-scope" },
	{ import = move .. "mini-ai" },

	-- Utils
	{ import = util .. "surround" },
	{ import = util .. "treesj" },
	{ import = util .. "comments" },
	{ import = util .. "bbye" },
	{ import = util .. "illuminate" },
	{ import = util .. "undotree" },
	{ import = util .. "todo" },

	-- LSP
	{ import = lsp .. "lsp" },
	{ import = lsp .. "cmp" },
	{ import = lsp .. "formatter" },
	{ import = lsp .. "linter" },
	{ import = lsp .. "lspsaga" },
	{ import = lsp .. "garbage" },
	{ import = lsp .. "lsp-lens" },
	-- { import = lsp .. "trouble" },

	-- Other
	-- { import = other .. "neotest" },
	{ import = other .. "treesitter" },
	{ import = other .. "telescope" },
	{ import = other .. "which-key" },

	-- What
	{ import = integration .. "leetcode" },
	{ import = integration .. "wakatime" },
	{ import = integration .. "codeium" },

	-- Git
	{ import = git .. "git" },

	-- Local plugins
	{ dir = local_plugins .. "set_colors" },
	{ dir = local_plugins .. "zenmode" },
	{ dir = local_plugins .. "sessions" },
	{ dir = local_plugins .. "statusline" },

	-- Theme
	{ import = COLORSCHEME_PATH .. "init" },
}

if vim.g.neovide then
	table.insert(plugins, { import = util .. "terminal" })
else
	table.insert(plugins, { import = custom .. "pets" })
end

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = plugins,
	lockfile = vim.fn.stdpath("config") .. "/lua/main/plugins/lazy-lock.json",
})
