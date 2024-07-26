local M = {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",

		"marilari88/neotest-vitest",
	},
	event = "BufRead",
}

function M.config()
	local neotest = require("neotest")

	neotest.setup({
		adapters = {
			require("neotest-vitest"),
		},
	})

	Bind({
		["n"] = {
			["<plugleader>tr"] = {
				function()
					neotest.run.run(vim.fn.expand("%"))
					vim.cmd("M summary open")
				end,
			},
			["<plugleader>ts"] = { neotest.run.stop },
			["<plugleader>tS"] = { "<cmd>M summary toggle<cr>" },
			["<plugleader>ta"] = { neotest.run.attach },
			["<plugleader>to"] = { "<cmd>M output<cr>" },
		},
	})
end

return M
