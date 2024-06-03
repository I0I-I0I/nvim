--
-- Find words

vim.cmd("set wildignore+=*/node_modules/**")
vim.cmd("set wildignore+=*/.git/**")
vim.cmd("set wildignore+=*/dist/**")

local function betterGrep(pattern, file, path)
	if not file then
		vim.cmd("vimgrep /" .. pattern .. "/jfg " .. "**/*.*")
	elseif not path then
		vim.cmd("vimgrep /" .. pattern .. "/jfg " .. "**/" .. file)
	else
		vim.cmd("vimgrep /" .. pattern .. "/jfg " .. path .. "/**/" .. file)
	end
end

vim.api.nvim_create_user_command("Grep", function(input)
	local pattern = input.fargs[1]
	local file = input.fargs[2]
	local path = input.fargs[3]
	betterGrep(pattern, file, path)
	vim.cmd("copen")
end, {
	nargs = "*",
})

vim.keymap.set("n", "<leader>fg", ":Grep ")

--
-- Find files

vim.cmd("set path+=src/**")

vim.keymap.set("n", "<leader>ff", ":find ")
