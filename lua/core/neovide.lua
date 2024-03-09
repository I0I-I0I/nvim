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

function CloseAllWindows(cmd)
	if cmd == "q" then
		vim.cmd([[
            Bdelete
            try
                close
            catch
                OpenVeil
            endtry
        ]])
	elseif cmd == "wq" then
		vim.cmd([[
            w
            Bdelete
            try
                close
            catch
                OpenVeil
            endtry
        ]])
	elseif cmd == "qa" then
		vim.cmd([[
            bufdo :Bdelete
            tabonly
            only
            OpenVeil
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
            OpenVeil
        ]])
	elseif cmd == "c" then
		vim.cmd("close")
	end
end

vim.cmd([[
	cnoreabbrev q lua CloseAllWindows('q')
    cnoreabbrev Q lua CloseAllWindows('q')

	cnoreabbrev qa lua CloseAllWindows('qa')
    cnoreabbrev Qa lua CloseAllWindows('qa')

	cnoreabbrev wq lua CloseAllWindows('wq')
    cnoreabbrev Wq lua CloseAllWindows('wq')
    cnoreabbrev WQ lua CloseAllWindows('wq')

	cnoreabbrev wqa lua CloseAllWindows('wqa')
	cnoreabbrev Wqa lua CloseAllWindows('wqa')

	cnoreabbrev c lua CloseAllWindows('c')

	cnoreabbrev dcode /mnt/d/code/
	cnoreabbrev dbot /mnt/d/code/project/learningEnglish/
]])

vim.cmd([[
    try
        OpenVeil
    catch
    endtry
]])
