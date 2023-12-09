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

local alpha = function()
	return string.format("%x", math.floor(255 * vim.g.transparency or 0.8))
end

vim.g.neovide_transparency = 0.7
vim.g.transparency = 0.0
vim.g.neovide_background_color = "#0f1117" .. alpha()

vim.g.neovide_hide_mouse_when_typing = true

vim.g.neovide_fullscreen = true

vim.o.guifont = "MonaspaceKrypton Nerd Font"

function CloseAllWindows(cmd)
	if cmd == "q" then
		vim.cmd([[
            Bdelete
            try
                close
            catch
                lua OpenVeil()
            endtry
        ]])
	elseif cmd == "wq" then
		vim.cmd([[
            w
            Bdelete
            try
                close
            catch
                lua OpenVeil()
            endtry
        ]])
	elseif cmd == "qa" then
		vim.cmd([[
            bufdo :Bdelete
            tabonly
            only
            lua OpenVeil()
        ]])
	elseif cmd == "wqa" then
		vim.cmd([[
            wa
            tabonly
            only
            try
                bufdo :Bdelete!
            catch
                echo "Error :Bdelete"
            endtry
            lua OpenVeil()
        ]])
	elseif cmd == "c" then
		vim.cmd("close")
	end
end

vim.cmd([[
	ab q lua CloseAllWindows('q')
	ab qa lua CloseAllWindows('qa')
	ab wq lua CloseAllWindows('wq')
	ab wqa lua CloseAllWindows('wqa')
	ab c lua CloseAllWindows('c')

	ab dcode /mnt/d/code/
	ab dbot /mnt/d/code/project/learningEnglish/
]])

vim.keymap.set("v", "<A-c>", '"+y') -- Copy
vim.keymap.set({ "i", "v", "n" }, "<A-v>", '"+P') -- Paste

-- NeoTree
vim.api.nvim_create_autocmd("NeotreeEvent_vim_win_leave", {
	command = "set cursorline",
})
