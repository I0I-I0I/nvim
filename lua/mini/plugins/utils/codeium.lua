local M = {
	"Exafunction/codeium.vim",
	event = "BufEnter",
}

function M.init()
	vim.g.codeium_enable = true
	vim.g.codeium_manual = false
end

M.keys = {
	{
		"<A-y>",
		function()
			return vim.fn["codeium#Accept"]()
		end,
		mode = "i",
		{ expr = true, silent = true },
	},
	{
		"<A-n>",
		function()
			return vim.fn["codeium#CycleCompletions"](1)
		end,
		mode = "i",
		{ expr = true, silent = true },
	},
	{
		"<A-p>",
		function()
			return vim.fn["codeium#CycleCompletions"](-1)
		end,
		mode = "i",
		{ expr = true, silent = true },
	},
	{
		"<A-q>",
		function()
			return vim.fn["codeium#Clear"]()
		end,
		mode = "i",
		{ expr = true, silent = true },
	},
}

return M
