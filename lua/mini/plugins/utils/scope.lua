local M = {
	"tiagovla/scope.nvim",
	event = "VeryLazy",
}

function M.config()
	require("scope").setup()
end

return M
