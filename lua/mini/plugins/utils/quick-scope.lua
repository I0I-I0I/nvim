local M = {
	"unblevable/quick-scope",
	event = "VeryLazy",
}

vim.g.qs_highlight_on_keys = { "f", "F", "t", "T" }
vim.g.qs_filetype_blacklist = { "veil", "mason", "quick-scope", "lazy", "trouble", "neo-tree", "TelescopePrompt" }
vim.g.qs_lazy_highlight = 1
vim.g.qs_hi_priority = 2

vim.cmd([[
    augroup qs_colors
      autocmd!
      autocmd ColorScheme * highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
      autocmd ColorScheme * highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
    augroup END
]])

return M
