-- Source
function Source()
	vim.cmd("w | source")
end

vim.api.nvim_create_user_command("Source", Source, {})
vim.cmd("ab so Source")
