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
local git = plugins .. "git."
local other = plugins .. "other."
local integration = plugins .. "integration."

require("lazy").setup({
	-- Theme
	{ import = theme .. "colorscheme" },

	-- Customization
	{ import = custom .. "pets" },
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

	-- Utils
	{ import = util .. "surround" },
	{ import = util .. "treesj" },
	{ import = util .. "comments" },
	{ import = util .. "bbye" },
	{ import = util .. "illuminate" },
	{ import = util .. "undotree" },
	{ import = util .. "todo" },
	{ import = util .. "terminal" },

	-- LSP
	{ import = lsp .. "lsp" },
	{ import = lsp .. "cmp" },
	{ import = lsp .. "formatter" },
	{ import = lsp .. "linter" },
	{ import = lsp .. "lspsaga" },
	{ import = lsp .. "garbage" },
	{ import = lsp .. "lsp-lens" },
	{ import = lsp .. "trouble" },

	-- Other
	{ import = other .. "neotest" },
	{ import = other .. "treesitter" },
	{ import = other .. "telescope" },
	{ import = other .. "session" },

	-- What
	{ import = integration .. "leetcode" },
	{ import = integration .. "wakatime" },
	{ import = integration .. "codeium" },

	-- Git
	{ import = git .. "git" },
})
