local M = { "stevearc/oil.nvim" }

M.lazy = false

M.opts = {
	delete_to_trash = true,
	skip_confirm_for_simple_edits = true,
	use_default_keymaps = false,
	keymaps = {
		["g?"] = "actions.show_help",
		["<CR>"] = "actions.select",
		["R"] = "actions.refresh",
		["<C-p>"] = "actions.preview",
		["q"] = "actions.close",
		["-"] = "actions.parent",
		["_"] = "actions.open_cwd",
		["`"] = "actions.cd",
		["~"] = { "actions.cd", opts = { scope = "tab" }, desc = ":tcd to the current oil directory", mode = "n" },
		["gs"] = "actions.change_sort",
		["gx"] = "actions.open_external",
		["g."] = "actions.toggle_hidden",
		["g\\"] = "actions.toggle_trash",
	},
}

M.keys = {
	{ "-", "<cmd>Oil<cr>", desc = "Open oil", { silent = true, noremap = true } },
}

return M
