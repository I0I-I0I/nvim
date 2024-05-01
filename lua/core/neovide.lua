vim.g.neovide_scale_factor = 1.09
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

vim.o.guifont = "MonaspaceKrypton Nerd Font"

-- if vim.g.neovide then
-- 	local alpha = function()
-- 		return string.format("%x", math.floor((255 * vim.g.transparency) or 0.8))
-- 	end
-- 	vim.g.neovide_transparency = transparent
-- 	vim.g.transparency = 0.0
-- 	vim.g.neovide_background_color = "#0f1117" .. alpha()
-- end

-- else
-- 	if vim.g.neovide then
-- 		vim.g.neovide_transparency = transparent
-- 	end
