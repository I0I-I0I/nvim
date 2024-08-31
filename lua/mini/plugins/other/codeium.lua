local M = {
	"monkoose/neocodeium",
	event = "VeryLazy",
}

M.config = function()
	local neocodeium = require("neocodeium")
	neocodeium.setup({
		manual = true,
	})

	vim.keymap.set("i", "<A-y>", neocodeium.accept)
	vim.keymap.set("i", "<A-l>", neocodeium.accept_word)
	vim.keymap.set("i", "<A-j>", neocodeium.cycle_or_complete)
	vim.keymap.set("i", "<A-k>", function()
		neocodeium.cycle_or_complete(-1)
	end)
end

return M
