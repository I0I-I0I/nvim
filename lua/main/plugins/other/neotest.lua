local M = {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		"marilari88/neotest-vitest",
	},
}

function M.config()
	require("neotest").setup({
		adapters = {
			require("neotest-vitest"),
		},
	})
end

M.cmd = { "Neotest" }

M.keys = function()
	local neotest = require("neotest")
	return {
		{
			"<leader>tr",
			function()
				neotest.run.run(vim.fn.expand("%"))
				vim.cmd("M summary open")
			end,
			desc = "Run Test",
		},
		{ "<leader>ts", "<cmd>Neotest stop<cr>", desc = "Stop Test" },
		{ "<leader>tS", "<cmd>Neotest summary toggle<cr>", desc = "Toggle Summary" },
		{ "<leader>ta", "<cmd>Neotest attach<cr>", desc = "Attach Test" },
		{ "<leader>to", "<cmd>Neotest output<cr>", desc = "Open Output" },
	}
end

return M
