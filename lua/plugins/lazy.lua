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

local p = "plugins."
set_plugins({
	-- Colorscheme
	{ import = p .. "colorscheme.init" },

	-- Local
	{ import = p .. "local.sessions" },
	{ import = p .. "local.zenmode" },
	{ import = p .. "local.set_colors" },

	-- LSP
	{ import = p .. "lsp.lsp" },
	{ import = p .. "lsp.cmp" },
	{ import = p .. "lsp.ts-tools" },

	-- Other
	{ import = p .. "other.telescope" },
	{ import = p .. "other.treesitter" },
	{ import = p .. "other.harpoon" },
	{ import = p .. "other.codeium" },
	{ import = p .. "other.git" },
	{ import = p .. "other.undotree" },
	{ import = p .. "other.surround" },
	{ import = p .. "other.colorizer" },
	{ import = p .. "other.emmet" },
})

-- Current color scheme
require("plugins.colorscheme.theme")
