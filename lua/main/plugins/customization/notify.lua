local M = {
	"rcarriga/nvim-notify",
	lazy = false,
}

function M.config()
	require("notify").setup({
		background_colour = "#000000",
		max_width = 50,
		render = "compact",
		stages = "slide",
		timeout = 3000,
		top_down = true,
	})

	vim.keymap.set("n", "<leader>fn", "<cmd>Telescope notify theme=dropdown<cr>", { silent = true })
end

return M
