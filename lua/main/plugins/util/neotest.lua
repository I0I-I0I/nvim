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
	local neotest = require("neotest")

	neotest.setup({
		adapters = {
			require("neotest-vitest"),
		},
	})

	vim.keymap.set("n", "<leader>tr", function()
		neotest.run.run(vim.fn.expand("%"))
		vim.cmd("M summary open")
	end)
	vim.keymap.set("n", "<leader>ts", neotest.run.stop)
	vim.keymap.set("n", "<leader>tS", "<cmd>M summary toggle<cr>")
	vim.keymap.set("n", "<leader>ta", neotest.run.attach)
	vim.keymap.set("n", "<leader>to", "<cmd>M output<cr>")
end

return M
