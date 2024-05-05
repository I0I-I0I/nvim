if vim.g.vscode then
	require("vscode")
elseif vim.g.neovide then
	require("neovide")
else
	require("main")
end
