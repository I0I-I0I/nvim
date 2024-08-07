-- Plugins
local custom = vim.g.plugins_path .. "customization."
local move = vim.g.plugins_path .. "move."
local util = vim.g.plugins_path .. "util."
local lsp = vim.g.plugins_path .. "lsp."
local git = vim.g.plugins_path .. "git."
local other = vim.g.plugins_path .. "other."
local integration = vim.g.plugins_path .. "integration."
vim.g.local_plugins_path = vim.fn.stdpath("config") .. "/plugins/"

local plugins = {
	-- Local
	{ dir = vim.g.local_plugins_path .. "statusline" },
	{ import = vim.g.plugins_path .. "local.sessions" },
	{ import = vim.g.plugins_path .. "local.zenmode" },
	{ import = vim.g.plugins_path .. "local.set_colors" },

	-- Theme
	{ import = vim.g.config_path .. ".colorscheme.init" },

	-- Customization
	{ import = custom .. "icons" },
	{ import = custom .. "indentline" },
	{ import = custom .. "bufferline" },
	{ import = custom .. "notify" },
	{ import = custom .. "noice" },
	{ import = custom .. "veil" },
	{ import = custom .. "colorizer" },
	{ import = custom .. "ts-error-translator" },
	{ import = custom .. "dressing" },

	-- Move
	{ import = move .. "nvim-tree" },
	{ import = move .. "spider" },
	{ import = move .. "mini-ai" },

	-- Utils
	{ import = util .. "surround" },
	{ import = util .. "treesj" },
	{ import = util .. "comments" },
	{ import = util .. "bbye" },
	{ import = util .. "illuminate" },
	{ import = util .. "undotree" },
	{ import = util .. "todo" },
	{ import = util .. "scope" },

	-- LSP
	{ import = lsp .. "lsp" },
	{ import = lsp .. "cmp" },
	{ import = lsp .. "formatter" },
	{ import = lsp .. "linter" },
	{ import = lsp .. "lspsaga" },
	-- { import = lsp .. "lsp-lens" },
	{ import = lsp .. "trouble" },

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
}

if vim.g.neovide then
	table.insert(plugins, { import = util .. "terminal" })
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
