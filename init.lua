-- Basic
require("core.config")
require("core.mappings")
-- Plugins
require("plugins.manager")
-- Themes
require("themes.config")

-- NeoVide
if vim.g.neovide then
	require("core.neovide")
end
