vim.g.neovide_scale_factor = 1.05
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

local alpha = function()
	return string.format("%x", math.floor(255 * vim.g.transparency or 0.8))
end

vim.g.neovide_transparency = 0.7
vim.g.transparency = 0.0
vim.g.neovide_background_color = "#0f1117" .. alpha()

vim.g.neovide_hide_mouse_when_typing = true

vim.g.neovide_fullscreen = true

vim.o.guifont = "MesloLGS NS"

function closeAllWindows(cmd)
	if cmd == "q" then
		vim.cmd("Bdelete!")
	end

	if cmd == "wq" then
		vim.cmd([[
            w!
            Bdelete!
        ]])
	end

	if cmd == "qa" then
		vim.cmd([[
            bufdo :Bdelete!
            tabonly
            only
            Veil
            set nocursorline
        ]])
	end

	if cmd == "wqa" then
		vim.cmd([[
            wa!
            bufdo :Bdelete!
            tabonly
            only
            Veil
            set nocursorline
        ]])
	end
end

vim.cmd([[
	ab q lua closeAllWindows('q')
	ab qa lua closeAllWindows('qa')
	ab wq lua closeAllWindows('wq')
	ab wqa lua closeAllWindows('wqa')

	ab dcode /mnt/d/code/
	ab dbot /mnt/d/code/project/learningEnglish/
]])

vim.keymap.set("v", "<A-c>", '"+y') -- Copy
vim.keymap.set("n", "<A-v>", '"+P') -- Paste normal mode
vim.keymap.set("i", "<A-v>", '"+P') -- Paste normal mode
vim.keymap.set("v", "<A-v>", '"+P') -- Paste visual mode
