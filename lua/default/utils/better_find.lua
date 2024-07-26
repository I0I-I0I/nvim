--
-- Find words

vim.cmd("set wildignore+=node_modules/**")
vim.cmd("set wildignore+=.git/**")
vim.cmd("set wildignore+=dist/**")

--
-- Find files

vim.cmd("set path+=src/**,~/.config/nvim/**")

vim.cmd([[
    set grepprg=rg\ --vimgrep\ --smart-case\ --follow
]])

Bind({
	["n"] = {
		["<leader>fg"] = { ":grep " },
		["<leader>ff"] = { ":find " },
	},
})