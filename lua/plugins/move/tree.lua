vim.fn.sign_define("DiagnosticSignError", { text = "- ", texthl = "DiagnosticSignError" })

vim.fn.sign_define("DiagnosticSignWarn", { text = "! ", texthl = "DiagnosticSignWarn" })

vim.fn.sign_define("DiagnosticSignInfo", { text = "i ", texthl = "DiagnosticSignInfo" })

vim.fn.sign_define("DiagnosticSignHint", { text = "? ", texthl = "DiagnosticSignHint" })

require("neo-tree").setup({
	filesystem = {
		filtered_items = {
			visible = true,
			hide_dotfiles = true,
			never_show = {
				"node_modules",
				".git",
				".DS_Store",
				"package-lock.json",
			},
		},
	},

	close_if_last_window = false,
	popup_border_style = "rounded",
	modified = {
		symbol = "✚",
		highlight = "NeoTreeModified",
	},
	git_status = {
		symbols = {
			-- Change type
			added = "✚",
			modified = "",
			deleted = "✖",
			renamed = "󰁕",
			-- Status type
			untracked = "",
			ignored = "",
			unstaged = "󰄱",
			staged = "",
			conflict = "",
		},
	},
	window = {
		width = 30,
		mappings = {
			["P"] = { "toggle_preview", config = { use_float = true, use_image_nvim = true } },
		},
	},
})

-- NeoTree
vim.keymap.set("n", "<C-b>", ":Neotree float focus toggle<cr>", { silent = true })
