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

M.opts = {
	adapters = {
		require("neotest-vitest"),
	},
}

M.cmd = { "Neotest" }

M.keys = {
	{
		"<leader>tr",
		function()
			require("neotest").run.run(vim.fn.expand("%"))
			vim.cmd("M summary open")
		end,
		desc = "Run Test",
	},
	{ "<leader>ts", require("neotest").run.stop, desc = "Stop Test" },
	{ "<leader>tS", "<cmd>Neotest summary toggle<cr>", desc = "Toggle Summary" },
	{ "<leader>ta", require("neotest").run.attach, desc = "Attach Test" },
	{ "<leader>to", "<cmd>Neotest output<cr>", desc = "Open Output" },
}

return M
