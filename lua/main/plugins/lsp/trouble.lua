local Trouble = {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = "BufRead",
}

function Trouble.config()
	require("trouble").setup({})
	vim.keymap.set("n", "<leader>t", "<cmd>TroubleToggle<cr>", { silent = true, noremap = true })
end

return Trouble
