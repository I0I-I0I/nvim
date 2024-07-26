Bind({
	["i"] = {
		["<A-y>"] = {
			function()
				return vim.fn["codeium#Accept"]()
			end,
			{ expr = true, silent = true },
		},
		["<A-n>"] = {
			function()
				return vim.fn["codeium#CycleCompletions"](1)
			end,
			{ expr = true, silent = true },
		},
		["<A-p>"] = {
			function()
				return vim.fn["codeium#CycleCompletions"](-1)
			end,
			{ expr = true, silent = true },
		},
		["<A-q>"] = {
			function()
				return vim.fn["codeium#Clear"]()
			end,
			{ expr = true, silent = true },
		},
	},
})
