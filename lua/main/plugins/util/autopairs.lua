local M = {
	"altermo/ultimate-autopair.nvim",
	event = "InsertEnter",
	branch = "v0.6",
	opts = {},
}

function M.config()
	local autopairs = require("ultimate-autopair")

	autopairs.setup({
		profile = "default",
		cmap = false,
		pair_cmap = false,
	})
end

return M
