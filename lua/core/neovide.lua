vim.g.neovide_scale_factor = 1.05
vim.g.neovide_padding_top = 0
vim.g.neovide_padding_bottom = 0
vim.g.neovide_padding_right = 0
vim.g.neovide_padding_left = 0

vim.g.neovide_refresh_rate = 144

local alpha = function()
	return string.format("%x", math.floor(255 * vim.g.transparency or 0.8))
end

vim.g.neovide_transparency = 0.65
vim.g.transparency = 0.0
vim.g.neovide_background_color = "#0f1117" .. alpha()

vim.g.neovide_hide_mouse_when_typing = true

vim.g.neovide_fullscreen = true

vim.o.guifont = "MesloLGS NS"

function repeatCommand(n, command)
	for i = n, 1, -1 do
		vim.cmd("Bdelete!")
	end
end

function closeAllWindows(cmdCommand)
	if cmdCommand == "q" then
		vim.cmd([[
			Bdelete
			close
		]])
		return
	end
	if cmdCommand == "wq" then
		vim.cmd("w")
	end
	if cmdCommand == "wqa" then
		vim.cmd("wa")
	end

	repeatCommand(10, "Bdelete")
	vim.cmd([[
		tabonly
		only
		Veil
		set nocursorline
	]])
end

vim.cmd([[
	ab q lua closeAllWindows('q')
	ab qa lua closeAllWindows('qa')
	ab wq lua closeAllWindows('wq')
	ab wqa lua closeAllWindows('wqa')

	ab dcode /mnt/d/code/
]])

vim.keymap.set("v", "<A-c>", '"+y') -- Copy
vim.keymap.set("n", "<A-v>", '"+P') -- Paste normal mode
vim.keymap.set("i", "<A-v>", '"+P') -- Paste normal mode
vim.keymap.set("v", "<A-v>", '"+P') -- Paste visual mode
