local other = vim.g.plugins_path .. "other."
local utils = vim.g.plugins_path .. "utils."
vim.g.local_plugins_path = vim.fn.stdpath("config") .. "/plugins/"

local plugins = {
	-- Local
	{ dir = vim.g.local_plugins_path .. "tabline" },
	{ import = vim.g.plugins_path .. "local.sessions" },
	{ import = vim.g.plugins_path .. "local.zenmode" },
	{ import = vim.g.plugins_path .. "local.set_colors" },

	-- Colorscheme
	{ import = vim.g.config_path .. ".colorscheme.init" },

	-- Utils
	{ import = utils .. "scope" },
	{ import = utils .. "undotree" },
	{ import = utils .. "bbye" },
	{ import = utils .. "surround" },
	{ import = utils .. "ai" },
	{ import = utils .. "spider" },

	-- Other
	{ import = other .. "telescope" },
	{ import = other .. "treesitter" },
	{ import = other .. "git" },

	-- LSP
	{ import = vim.g.lsp_path .. "lsp" },
	-- { import = vim.g.lsp_path .. "cmp" },
	{ import = vim.g.lsp_path .. "formatter" },
	{ import = vim.g.lsp_path .. "linter" },

	-- AI
	-- { import = plugins .. "codeium" },
}

require(vim.g.plugins_path .. "lazy_init")(plugins)
