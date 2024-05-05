local Cybu = {
	"ghillb/cybu.nvim",
	branch = "main",
	keys = {
		{ "<C-k>" },
		{ "<C-j>" },
	},
}

function Cybu.config()
	local cybu = require("cybu")

	cybu.setup({})

	vim.keymap.set("n", "<C-k>", "<Plug>(CybuPrev)")
	vim.keymap.set("n", "<C-j>", "<Plug>(CybuNext)")
end

return Cybu
