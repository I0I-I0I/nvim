local qol_path = vim.g.settings_path .. "qol."
local config_path = vim.g.settings_path .. "config."

autocmd = vim.api.nvim_create_autocmd
augroup = vim.api.nvim_create_augroup

require(qol_path .. "bind")
require(qol_path .. "resize")
require(qol_path .. "yank")
require(qol_path .. "better_find")
require(qol_path .. "vertical_help")
require(qol_path .. "source")
require(qol_path .. "cursor_line")
require(qol_path .. "terminal_mode")
require(qol_path .. "move_by_buffers")
require(qol_path .. "hurl")

require(config_path .. "config")
require(config_path .. "mappings")
