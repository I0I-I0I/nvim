local M = {
	"ptdewey/pendulum-nvim",
	lazy = false,
}

function M.config()
	require("pendulum").setup({
		-- gen_reports = false,
		log_file = vim.fn.expand("/mnt/d/code/time-spend.csv"),
	})
end

M.keys = {
	{ "<leader>t", "<cmd>Pendulum<cr>", { silent = true } },
}

return M
