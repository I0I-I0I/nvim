if vim.g.neovide then
	require("main.neovide")
	require("main")
else
	require("mini")
end
