vim.opt.cmdheight = 1
vim.opt.fillchars = "eob:\\u00A0,vert:\\u00A0"
vim.opt.showtabline = 1

function OnExitAndSave()
	vim.cmd("ZenmodeCloseAll")
	vim.cmd("SessionCreate")
	vim.cmd("wqa")
end

vim.api.nvim_create_user_command("CloseAll", function()
	vim.cmd("ZenmodeCloseAll")
	vim.cmd("silent tabonly")
	vim.cmd("silent only")
	vim.cmd("bufdo :Bdelete")
end, {})

vim.cmd([[
	cnoreabbrev wqa lua OnExitAndSave()
	cnoreabbrev c close
	cnoreabbrev C CloseAll
]])

-- Colors
vim.g.colorscheme = "rose-pine"
vim.cmd.colorscheme(vim.g.colorscheme)

local f = 0
vim.api.nvim_create_user_command("TB", function()
	if f == 0 then
		vim.cmd.hi("NormalNC guibg=Normal")
		vim.cmd.hi("Normal guibg=NONE")
		f = 1
	else
		vim.cmd.colorscheme(vim.g.colorscheme)
		f = 0
	end
end, {})

vim.keymap.set("n", "<localleader>tt", vim.cmd.TB, {})

vim.cmd.hi("NormalNC guibg=Normal")
vim.cmd.hi("Normal guibg=#1a160b")
