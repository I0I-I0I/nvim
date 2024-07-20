local M = {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	cmd = "Neotree",
	keys = {
		{ "<leader>nl", "<cmd>Neotree left toggle show .<cr>", { silent = true, noremap = true } },
		{ "<leader>nr", "<cmd>Neotree right toggle show .<cr>", { silent = true, noremap = true } },
		{ "<leader>nf", "<cmd>Neotree close<cr><cmd>Neotree float toggle .<cr>", { silent = true, noremap = true } },
	},
}

function M.config()
	vim.fn.sign_define("DiagnosticSignError", { text = LspIcons.error, texthl = "DiagnosticSignError" })
	vim.fn.sign_define("DiagnosticSignWarn", { text = LspIcons.warn, texthl = "DiagnosticSignWarn" })
	vim.fn.sign_define("DiagnosticSignHint", { text = LspIcons.hint, texthl = "DiagnosticSignHint" })
	vim.fn.sign_define("DiagnosticSignInfo", { text = LspIcons.info, texthl = "DiagnosticSignInfo" })

	require("neo-tree").setup({
		filesystem = {
			filtered_items = {
				visible = true,
				hide_dotfiles = false,
				never_show = {
					"node_modules",
					".git",
					".DS_Store",
					"package-lock.json",
				},
			},
		},

		close_if_last_window = true,
		popup_border_style = "rounded",
		default_component_configs = {
			modified = {
				symbol = "",
				highlight = "NeoTreeModified",
			},
			icon = {
				folder_closed = " ", --  
				folder_open = " ", --  
				folder_empty = "󰜌",
				highlight = "NeoTreeFileIcon",
			},
			name = {
				use_git_status_colors = false,
				highlight = "NeoTreeFileName",
			},
			git_status = {
				symbols = {
					-- Change type
					added = " ",
					modified = " ",
					deleted = " ",
					renamed = " ",
					-- Status type
					untracked = " ",
					ignored = "",
					unstaged = "󰄱",
					staged = "",
					conflict = "",
				},
			},
		},
		window = {
			position = "left",
			width = 33,
			mappings = {
				["P"] = { "toggle_preview", config = { use_float = true, use_image_nvim = true } },
			},
		},
		source_selector = {
			winbar = true,
			statusline = false,
		},
	})

	-- NeoTree
end

return M
