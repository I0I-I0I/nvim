vim.opt.cmdheight = 1

-- autocmd("VimEnter", {
-- 	callback = function()
-- 		vim.defer_fn(function()
-- 			vim.cmd("SessionAttach")
-- 			vim.cmd("ZenmodeOpenAll")
-- 		end, 50)
-- 	end,
-- })

function OnExitAndSave()
	vim.cmd("ZenmodeCloseAll")
	vim.cmd("SessionCreate")
	vim.cmd("wqa")
end

function OnExit()
	vim.cmd("ZenmodeCloseAll")
	vim.cmd("silent tabonly")
	vim.cmd("silent only")
	vim.cmd("bufdo :Bdelete")
end

vim.cmd([[
    cnoreabbrev wqa silent lua OnExitAndSave()
    cnoreabbrev qa silent lua OnExit()
    cnoreabbrev c silent close
]])

vim.opt.fillchars = "eob:\\u00A0,vert:\\u00A0"
