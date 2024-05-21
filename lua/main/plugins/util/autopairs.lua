local AutoPairs = {
	"altermo/ultimate-autopair.nvim",
	event = "InsertEnter",
	branch = "v0.6",
	opts = {},
}

function AutoPairs.config()
	local autopairs = require("ultimate-autopair")

	autopairs.setup({
		profile = "default",
		cmap = false,
		pair_cmap = false,
	})
end

return AutoPairs
