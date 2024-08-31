local other = vim.g.plugins_path .. "other."
local utils = vim.g.plugins_path .. "utils."
vim.g.local_plugins_path = vim.fn.stdpath("config") .. "/plugins/"

local plugins = {
	-- Local
	{ import = vim.g.plugins_path .. "local.sessions" },
	{ import = vim.g.plugins_path .. "local.zenmode" },
	{ import = vim.g.plugins_path .. "local.set_colors" },
	{ import = vim.g.plugins_path .. "local.chat" },

	-- Colorscheme
	{ import = vim.g.config_path .. ".colorscheme.init" },

	-- Utils
	{ import = utils .. "undotree" },
	{ import = utils .. "surround" },
	{ import = utils .. "colorizer" },

	-- Other
	{ import = other .. "telescope" },
	{ import = other .. "treesitter" },
	{ import = other .. "git" },
	{ import = other .. "harpoon" },
	{ import = other .. "codeium" },
	{ import = other .. "time" },

	-- LSP
	{ import = vim.g.lsp_path .. "lsp" },
	{ import = vim.g.lsp_path .. "emmet" },
	{ import = vim.g.lsp_path .. "ts-tools" },
	{ import = vim.g.lsp_path .. "cmp" },
}

require(vim.g.plugins_path .. "lazy_init")(plugins)
