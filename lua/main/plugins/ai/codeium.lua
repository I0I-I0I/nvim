local Codeium = {
	"Exafunction/codeium.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"hrsh7th/nvim-cmp",
	},
	event = "InsertEnter",
}

function Codeium.config()
	require("codeium").setup({
		enable_chat = true,
	})
end

return Codeium
