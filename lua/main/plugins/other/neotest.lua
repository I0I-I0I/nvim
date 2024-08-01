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
				desc = "Run Test",
			},
			["<plugleader>ts"] = {
				neotest.run.stop,
				desc = "Stop Test",
			},
			["<plugleader>tS"] = {
				"<cmd>M summary toggle<cr>",
				desc = "Toggle Summary",
			},
			["<plugleader>ta"] = {
				neotest.run.attach,
				desc = "Attach Test",
			},
			["<plugleader>to"] = {
				"<cmd>M output<cr>",
				desc = "Open Output",
			},
		},
	})
end

return M
