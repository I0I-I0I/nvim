local Surround = {
	"kylechui/nvim-surround",
	version = "*",
	event = "InsertEnter",
}

function Surround.config()
	require("nvim-surround").setup()
end

return Surround
