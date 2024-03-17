-- Basic
require("core.config")
require("core.mappings")

-- Plugins
require("plugins.manager")

require("lazy").setup({
	{ import = "themes.setup" },
	{ import = "plugins.customization.setup" },
	{ import = "plugins.git.setup" },
	{ import = "plugins.lsp.setup" },
	{ import = "plugins.move.setup" },
	{ import = "plugins.util.setup" },
})

-- Themes
require("themes.config")

-- NeoVide
require("core.neovide")
