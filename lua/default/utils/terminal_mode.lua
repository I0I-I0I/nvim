vim.api.nvim_create_user_command("Term", function()
	vim.opt.number = false
	vim.opt.relativenumber = false
	vim.opt.signcolumn = "no"
	vim.opt.showmode = false
	vim.opt.showcmd = false
	vim.opt.ruler = false
	vim.opt.laststatus = 0
	vim.opt.cmdheight = 0
	vim.opt.spell = false
	-- vim.cmd("SetColor default 0")
	vim.cmd("terminal")
end, {})
