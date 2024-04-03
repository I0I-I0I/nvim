-- Basic
require("core.config")
require("core.mappings")

-- Plugins

Plugins = {
	{ import = "themes.setup" },
	{ import = "plugins.customization.setup" },
	{ import = "plugins.git.setup" },
	{ import = "plugins.lsp.setup" },
	{ import = "plugins.move.setup" },
	{ import = "plugins.util.setup" },
}

require("plugins.manager")

-- Themes
require("themes.config")
