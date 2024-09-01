local M = {
	"monkoose/neocodeium",
	event = "VeryLazy",
}

M.config = function()
	local neocodeium = require("neocodeium")
	neocodeium.setup({
		enable = false,
	})

	local commands = require("neocodeium.commands")

	vim.keymap.set({ "n", "i" }, "<A-t>", function ()
		commands.toggle()
		if neocodeium.visible() then
			neocodeium.clear()
		end
	end)
	vim.keymap.set("i", "<A-y>", neocodeium.accept)
	vim.keymap.set("i", "<A-l>", neocodeium.accept_line)
	vim.keymap.set("i", "<A-h>", neocodeium.accept_word)
	vim.keymap.set("i", "<A-n>", neocodeium.cycle_or_complete)
	vim.keymap.set("i", "<A-p>", function()
		neocodeium.cycle_or_complete(-1)
	end)
end

return M
