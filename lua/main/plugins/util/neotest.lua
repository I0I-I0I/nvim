local Neotest = {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",

		"marilari88/neotest-vitest",
	},
}

function Neotest.config()
	local neotest = require("neotest")

	neotest.setup({
		adapters = {
			require("neotest-vitest"),
		},
	})

	vim.keymap.set("n", "<leader>tr", function()
		neotest.run.run(vim.fn.expand("%"))
		vim.cmd("Neotest summary open")
	end)
	vim.keymap.set("n", "<leader>ts", neotest.run.stop)
	vim.keymap.set("n", "<leader>tS", "<cmd>Neotest summary toggle<cr>")
	vim.keymap.set("n", "<leader>ta", neotest.run.attach)
	vim.keymap.set("n", "<leader>to", "<cmd>Neotest output<cr>")
end

return Neotest
