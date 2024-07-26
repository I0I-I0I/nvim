vim.api.nvim_create_user_command("Hurl", function(input)
	local method
	local url
	local fileStorageName = "requestHurl.json"

	if input.fargs[1] ~= "GET" then
		method = "GET"
		url = input.fargs[1]
	else
		method = input.fargs[1]
		url = input.fargs[2]
	end

	vim.cmd("!echo " .. method .. " " .. url .. " | hurl > ~/" .. fileStorageName)

	local buffers = vim.fn.execute("ls")
	local allBuffers = vim.fn.execute("ScopeList")
	if not buffers:match(fileStorageName) and not allBuffers:match(fileStorageName) then
		vim.cmd("bo vs ~/requestHurl.json")
	end
end, {
	nargs = "*",
})

Bind({
	["n"] = {
		["<leader>r"] = {
			function()
				local pattern = "http[A-Za-z/.:1-9]*"
				local line = vim.fn.getline(".")
				local request = line:match(pattern)
				vim.cmd("Hurl " .. request)
			end,
		},
	},

	["v"] = {
		["<leader>r"] = {
			function()
				vim.cmd('norm "hy')
				local request = vim.fn.getreg("h")
				vim.cmd("Hurl " .. request)
			end,
		},
	},
})
