local M = {
	webDev = {
		"nvim-tree/nvim-web-devicons",
		lazy = true,
	},
	lspkind = {
		"onsails/lspkind.nvim",
		lazy = true,
	},
}

function M.webDev.config()
	require("nvim-web-devicons").setup({
		override = {},
		default = true,
		color_icons = true,
	})
end

LspIcons = {
	error = "✘ ",
	warn = " ",
	hint = "󰌶 ",
	info = "» ",
}

return {
	M.webDev,
	M.lspkind,
}

-- symbol_map = {
-- 	Text = "󰉿",
-- 	Method = "󰆧",
-- 	Function = "󰊕",
-- 	Constructor = "",
-- 	Field = "󰜢",
-- 	Variable = "󰀫",
-- 	Class = "󰠱",
-- 	Interface = "",
-- 	Module = "",
-- 	Property = "󰜢",
-- 	Unit = "󰑭",
-- 	Value = "󰎠",
-- 	Enum = "",
-- 	Keyword = "󰌋",
-- 	Snippet = "",
-- 	Color = "󰏘",
-- 	File = "󰈙",
-- 	Reference = "󰈇",
-- 	Folder = "󰉋",
-- 	EnumMember = "",
-- 	Constant = "󰏿",
-- 	Struct = "󰙅",
-- 	Event = "",
-- 	Operator = "󰆕",
-- 	TypeParameter = "",
-- },
