local tsj = require("treesj")

tsj.setup({
	use_default_keymaps = false,
	join = {
		space_in_brackets = true,
		space_separator = false,
		force_insert = "",
	},
})

vim.keymap.set("n", "<leader>j", require("treesj").toggle, { silent = true })
vim.keymap.set("n", "<leader>J", function()
	require("treesj").toggle({ split = { recursive = true } })
end)
