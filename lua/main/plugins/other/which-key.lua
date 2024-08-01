local M = {
	"folke/which-key.nvim",
	event = "VeryLazy",
}

function M.config()
	local wk = require("which-key")

	wk.setup({
		-- classic, modern, helix, false
		preset = "modern",
		delay = function()
			return 500
		end,
	})

	wk.add({
		{ ",f", group = "Telescope" },
		{ ",g", group = "GitSigns" },
		{ ",l", group = "LSP" },
		{ ",m", group = "Move" },
		{ ",z", group = "Zen Mode" },
		{ ",s", group = "Session" },

		{ "<space>f", group = "Find" },
		{ "<space>t", group = "Toggle" },
		{ "<space>w", group = "Window" },
	})

	Bind({
		["n"] = {
			["<leader>?"] = {
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	})
end

return M
