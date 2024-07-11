vim.g.neovide_scale_factor = 1
vim.g.neovide_padding_top = 0
vim.g.neovide_padding_bottom = 0
vim.g.neovide_padding_right = 0
vim.g.neovide_padding_left = 0

vim.g.neovide_refresh_rate = 144

vim.g.neovide_scroll_animation_length = 0.3
vim.g.neovide_cursor_animate_in_insert_mode = true
vim.g.neovide_cursor_animate_command_line = true
vim.g.neovide_scroll_animation_far_lines = 9999
vim.g.neovide_no_idle = true

vim.g.neovide_hide_mouse_when_typing = true

vim.g.neovide_fullscreen = true

-- vim.o.guifont = "MonaspaceKrypton Nerd Font"
-- vim.o.guifont = "GohuFont 14 Nerd Font"
-- vim.o.guifont = "Serious Sans Nerd Font Mono"
vim.o.guifont = "FantasqueSansM Nerd Font:h15:w0"
-- vim.o.guifont = "FantasqueSansM Nerd Font"

vim.opt.linespace = 1
vim.g.neovide_unlink_border_highlights = true

vim.keymap.set("n", "<C-=>", function()
	vim.cmd([[let g:neovide_scale_factor += 0.1]])
	print("Scale: " .. vim.g.neovide_scale_factor)
end, { silent = true, noremap = true })

vim.keymap.set("n", "<C-->", function()
	vim.cmd([[let g:neovide_scale_factor -= 0.1]])
	print("Scale: " .. vim.g.neovide_scale_factor)
end, { silent = true, noremap = true })

require("main")
