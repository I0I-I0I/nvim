-- Resize

autocmd("VimResized", {
	group = augroup("WinResize", { clear = true }),
	pattern = "*",
	command = "wincmd =",
})

-- Vertical help

autocmd("FileType", {
	group = augroup("VerticalHelp", { clear = true }),
	pattern = "help",
	callback = function()
		vim.bo.bufhidden = "unload"
		vim.cmd.wincmd("L")
		vim.cmd.wincmd("=")
	end,
})

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
