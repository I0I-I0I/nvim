local Hlargs = {
	"m-demare/hlargs.nvim",
	event = "BufRead",
}

function Hlargs.config()
	require("hlargs").setup()
end

return Hlargs
