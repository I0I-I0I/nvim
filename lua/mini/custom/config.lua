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

-- Win bar
local function set_winbar()
	local filetype = vim.bo.filetype
	if filetype and filetype ~= "" then
		return "%=%f%="
	end
	return ""
end

autocmd("BufEnter", {
	callback = function()
		vim.opt_local.winbar = set_winbar()
	end,
})

vim.keymap.del("n", "grr")
vim.keymap.del("n", "grn")
vim.keymap.del("n", "gra")
