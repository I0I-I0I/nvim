local Codeium = {
	"Exafunction/codeium.nvim",
	event = "InsertEnter",
}

function Codeium.config()
	require("codeium").setup({})
end

return Codeium
