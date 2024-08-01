local bg_style = vim.opt.bg._value
if bg_style == "light" then
	vim.cmd([[set bg=dark]])
else
	vim.cmd([[set bg=light]])
end
