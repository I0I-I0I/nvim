local M = {
	"Wansmer/treesj",
	event = "BufReadPost",
}

function M.config()
	local tsj = require("treesj")

	tsj.setup({
		use_default_keymaps = false,
		join = {
			space_in_brackets = true,
			space_separator = false,
			force_insert = "",
		},
	})

	Bind({
		["n"] = {
			["<plugleader>j"] = { require("treesj").toggle, { silent = true } },
			["<plugleader>J"] = {
				function()
					require("treesj").toggle({ split = { recursive = true } })
				end,
			},
		},
	})
end

return M
