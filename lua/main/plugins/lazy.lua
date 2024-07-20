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

-- Plugins

local custom = plugins .. "customization."
local move = plugins .. "move."
local util = plugins .. "util."
local lsp = plugins .. "lsp."
local ai = plugins .. "ai."
local git = plugins .. "git."

require("lazy").setup({
	-- Theme
	{ import = theme .. "colorscheme" },

	-- Customization
	{ import = custom .. "animation" },
	{ import = custom .. "blankline" },
	{ import = custom .. "bufferline" },
	{ import = custom .. "undo" },
	{ import = custom .. "notify" },
	{ import = custom .. "noice" },
	-- { import = custom .. "rainbow-brackets" },
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
	{ import = util .. "todo" },
	{ import = util .. "terminal" },
	{ import = util .. "multicursors" },

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
	{ import = ai .. "codeium" },

	-- Git
	{ import = git .. "git" },
})
