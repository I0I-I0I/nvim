local colorscheme = "colorscheme."
local local_plugin = vim.g.plugins_path .. "local."
local other = vim.g.plugins_path .. "other."
local utils = vim.g.plugins_path .. "utils."
local lsp = vim.g.lsp_path

vim.g.local_plugins_path = vim.fn.stdpath("config") .. "/plugins/"

vim.g.lsp_servers = {
	"lua_ls",
	"clangd",
	"html",
	"cssls",
	"cssmodules_ls",
	"css_variables",
}

vim.g.plugins = {
	-- Local
	{ import = local_plugin .. "sessions" },
	{ import = local_plugin .. "zenmode" },
	{ import = local_plugin .. "set_colors" },
	-- Colorscheme
	{ import = colorscheme .. "init" },
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
	-- LSP
	{ import = lsp .. "lsp" },
	{ import = lsp .. "cmp" },
	{ import = lsp .. "ts-tools" },
	{ import = lsp .. "emmet" },
}

require(vim.g.plugins_path .. "lazy_init")
