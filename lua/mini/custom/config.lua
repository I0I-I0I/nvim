vim.opt.cmdheight = 1

autocmd("VimEnter", {
	callback = function()
		vim.defer_fn(function()
			vim.cmd("SessionAttach")
			vim.cmd("ZenmodeOpenAll")
		end, 50)
	end,
})

autocmd("ExitPre", {
	callback = function()
		vim.cmd("ZenmodeCloseAll")
	end,
})

function OnExit()
	vim.cmd("ZenmodeCloseAll")
	vim.cmd("SessionCreate")
	vim.cmd("wqa")
end

vim.cmd([[
    cnoreabbrev wqa lua OnExit()
]])
