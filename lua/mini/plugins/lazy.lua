--
-- Config
local other = PLUGINS_PATH .. "other."
local utils = PLUGINS_PATH .. "utils."
local local_plugins = vim.fn.stdpath("config") .. "/plugins/"

local plugins = {
	{ import = utils .. "scope" },
	{ import = utils .. "undotree" },
	{ import = utils .. "bbye" },
	{ import = utils .. "quick-scope" },
	{ import = utils .. "surround" },
	{ import = utils .. "ai" },
	{ import = utils .. "spider" },

	{ import = other .. "telescope" },
	{ import = other .. "treesitter" },

	-- LSP
	{ import = LSP_PATH .. "mason" },
	{ import = LSP_PATH .. "cmp" },
	{ import = LSP_PATH .. "formatter" },

	-- AI
	-- { import = plugins .. "codeium" },

	-- Local plugins
	{ dir = local_plugins .. "set_colors" },
	{ dir = local_plugins .. "zenmode" },
	{ dir = local_plugins .. "sessions" },
	{ dir = local_plugins .. "statusline" },
	{ dir = local_plugins .. "tabline" },

	-- Themes
	{ import = COLORSCHEME_PATH .. ".init" },
}

local lazypath = vim.fn.stdpath("data") .. "/lazy.mini/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = plugins,

	root = vim.fn.stdpath("data") .. "/lazy.mini", -- directory where plugins will be installed
	lockfile = vim.fn.stdpath("config") .. "/lua/mini/plugins/lazy-lock.mini.json", -- lockfile generated after running update.
	state = vim.fn.stdpath("state") .. "/lazy.mini/state.json", -- state info for checker and other things
	pkg = {
		cache = vim.fn.stdpath("state") .. "/lazy.mini/pkg-cache.lua",
	},
	readme = {
		root = vim.fn.stdpath("state") .. "/lazy.mini/readme",
	},
	rocks = {
		root = vim.fn.stdpath("data") .. "/lazy-rocks.mini",
	},
})
