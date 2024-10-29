local ok, set_plugins = pcall(require, "plugins.lazy_init")
if not ok then
	error("Failed to load lazy")
	return
end

vim.g.local_plugins_path = vim.fn.stdpath("config") .. "/plugins/"
vim.g.lsp_servers = {
	"lua_ls",
	"clangd",
	"html",
	"cssls",
	"cssmodules_ls",
	"css_variables",
}

set_plugins({
	-- Local
	-- "local.sessions",
	"local.statusline",
	"local.zenmode",
	"local.set_colors",

	-- Colorscheme
	"colorscheme.init",

	-- LSP
	"lsp.lsp",
	"lsp.cmp",
	"lsp.ts-tools",
	"lsp.optimization",

	-- Other
	"other.telescope",
	"other.harpoon",
	"other.git",
	"other.codeium",
	"other.treesitter",
	"other.undotree",
	"other.oil",
	"other.surround",
	"other.colorizer",
	"other.emmet",
}, "plugins")

-- Current color scheme
ok, _ = pcall(require, "set_colors")
if ok then
	require("plugins.colorscheme.theme")
end
