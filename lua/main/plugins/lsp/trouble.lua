local Trouble = {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = "BufRead",
}

function Trouble.config()
	require("trouble").setup({})

	local opts = { silent = true, noremap = true }

	vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>", opts)
	vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle workspace_diagnostics<cr>", opts)
end

return Trouble
