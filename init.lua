if vim.g.neovide then
	require("version.neovide")
elseif vim.g.vscode then
	require("version.vscode")
else
	require("version.terminal")
end
