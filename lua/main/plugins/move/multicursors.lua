local M = {
	"brenton-leighton/multiple-cursors.nvim",
	version = "*", -- Use the latest tagged version
	opts = {}, -- This causes the plugin setup function to be called
}

function M.config()
	Bind({
		["nx"] = {
			["<C-j>"] = { "<Cmd>MultipleCursorsAddDown<CR>", { desc = "Add cursor and move down" } },
			["<C-k>"] = { "<Cmd>MultipleCursorsAddUp<CR>", { desc = "Add cursor and move up" } },

			["<plugleader>a"] = { "<Cmd>MultipleCursorsAddMatches<CR>", { desc = "Add cursors to cword" } },

			["<plugleader>A"] = {
				"<Cmd>MultipleCursorsAddMatchesV<CR>",
				{ desc = "Add cursors to cword in previous area" },
			},

			["<plugleader>d"] = {
				"<Cmd>MultipleCursorsAddJumpNextMatch<CR>",
				{ desc = "Add cursor and jump to next cword" },
			},

			["<plugleader>D"] = { "<Cmd>MultipleCursorsJumpNextMatch<CR>", { desc = "Jump to next cword" } },
			["<plugleader>l"] = { "<Cmd>MultipleCursorsLock<CR>", { desc = "Lock virtual cursors" } },
		},

		["nix"] = {
			["<C-Up>"] = { "<Cmd>MultipleCursorsAddUp<CR>", { desc = "Add cursor and move up" } },
			["<C-Down>"] = { "<Cmd>MultipleCursorsAddDown<CR>", { desc = "Add cursor and move down" } },
		},

		["ni"] = {
			["<C-LeftMouse>"] = {
				"<Cmd>MultipleCursorsMouseAddDelete<CR>",
				{ desc = "Add or remove cursor" },
			},
		},
	})

	require("multiple-cursors").setup({})
end

return M
