local M = {
	"hrsh7th/nvim-cmp",
	dependencies = {
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "hrsh7th/cmp-buffer" },
		{ "hrsh7th/cmp-cmdline" },
		{ "hrsh7th/cmp-path" },
		{ "saadparwaiz1/cmp_luasnip" },
		{
			"L3MON4D3/LuaSnip",
			version = "v2.*",
			build = "make install_jsregexp",
			dependencies = { "rafamadriz/friendly-snippets" },
		},
	},
	event = { "InsertEnter", "CmdlineEnter" },
}

function M.config()
	local cmp = require("cmp")

	require("luasnip.loaders.from_vscode").lazy_load()

	cmp.setup({
		snippet = {
			expand = function(args)
				require("luasnip").lsp_expand(args.body)
			end,
		},

		sources = cmp.config.sources({
			{ name = "nvim_lua", max_item_count = 10 },
			{ name = "nvim_lsp", max_item_count = 10 },
			{ name = "luasnip", option = { show_autosnippets = true }, max_item_count = 10 },
			{ name = "buffer", keyword_length = 3 },
		}, {
			{ name = "path", max_item_count = 10 },
		}),

		window = {
			cmp.config.window.bordered(),

			completion = {
				winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
				col_offset = -3,
				border = nil,
				side_padding = 0,
				scrollbar = false,
				scrolloff = 3,
			},
			documentation = {
				border = nil,
				col_offset = -3,
				side_padding = 1,
				scrollbar = false,
				scrolloff = 3,
			},
		},

		mapping = cmp.mapping.preset.insert({
			["<C-b>"] = cmp.mapping.scroll_docs(-4),
			["<C-f>"] = cmp.mapping.scroll_docs(4),
			["<C-e>"] = cmp.mapping.abort(),
			["<CR>"] = cmp.mapping.confirm({ select = true }),
		}),

		formatting = {
			fields = { "kind", "abbr", "menu" },
			format = function(entry, vim_item)
				local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
				local strings = vim.split(kind.kind, "%s", { trimempty = true })
				kind.kind = " " .. (strings[1] or "") .. " "
				kind.menu = "    (" .. (strings[2] or "") .. ")"
				return kind
			end,
		},

		experimental = {
			ghost_text = false,
			native_menu = false,
		},
	})

	cmp.setup.filetype("gitcommit", {
		sources = cmp.config.sources({
			{ name = "git" },
		}, {
			{ name = "buffer" },
		}),
	})

	cmp.setup.cmdline({ "/", "?" }, {
		mapping = cmp.mapping.preset.cmdline(),
		sources = {
			{ name = "buffer" },
			{ name = "path" },
		},
	})

	cmp.setup.cmdline(":", {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
			{ name = "path" },
		}, {
			{ name = "cmdline" },
		}),
	})

	cmp.setup.cmdline({ "/", "?" }, {
		mapping = cmp.mapping.preset.cmdline(),
		sources = {
			{ name = "buffer" },
		},
	})
end

vim.g.cmp_colors = {
	-- Customization for Pmenu
	{ "PmenuSel", { bg = "#282C34", fg = "NONE" } },
	{ "Pmenu", { fg = "#C5CDD9", bg = "#22252A" } },

	{ "CmpItemAbbrDeprecated", { fg = "#7E8294", bg = "NONE", strikethrough = true } },
	{ "CmpItemAbbrMatch", { fg = "#82AAFF", bg = "NONE", bold = true } },
	{ "CmpItemAbbrMatchFuzzy", { fg = "#82AAFF", bg = "NONE", bold = true } },
	{ "CmpItemMenu", { fg = "#C792EA", bg = "NONE", italic = true } },

	{ "CmpItemKindField", { fg = "#EED8DA", bg = "#B5585F" } },
	{ "CmpItemKindProperty", { fg = "#EED8DA", bg = "#B5585F" } },
	{ "CmpItemKindEvent", { fg = "#EED8DA", bg = "#B5585F" } },

	{ "CmpItemKindText", { fg = "#C3E88D", bg = "#9FBD73" } },
	{ "CmpItemKindEnum", { fg = "#C3E88D", bg = "#9FBD73" } },
	{ "CmpItemKindKeyword", { fg = "#C3E88D", bg = "#9FBD73" } },

	{ "CmpItemKindConstant", { fg = "#FFE082", bg = "#D4BB6C" } },
	{ "CmpItemKindConstructor", { fg = "#FFE082", bg = "#D4BB6C" } },
	{ "CmpItemKindReference", { fg = "#FFE082", bg = "#D4BB6C" } },

	--

	{ "CmpItemKindFunction", { fg = "#EADFF0", bg = "#A377BF" } },
	{ "CmpItemKindStruct", { fg = "#EADFF0", bg = "#A377BF" } },
	{ "CmpItemKindClass", { fg = "#EADFF0", bg = "#A377BF" } },
	{ "CmpItemKindModule", { fg = "#EADFF0", bg = "#A377BF" } },
	{ "CmpItemKindOperator", { fg = "#EADFF0", bg = "#A377BF" } },

	{ "CmpItemKindVariable", { fg = "#C5CDD9", bg = "#7E8294" } },
	{ "CmpItemKindFile", { fg = "#C5CDD9", bg = "#7E8294" } },

	{ "CmpItemKindUnit", { fg = "#F5EBD9", bg = "#D4A959" } },
	{ "CmpItemKindSnippet", { fg = "#F5EBD9", bg = "#D4A959" } },
	{ "CmpItemKindFolder", { fg = "#F5EBD9", bg = "#D4A959" } },

	{ "CmpItemKindMethod", { fg = "#DDE5F5", bg = "#6C8ED4" } },
	{ "CmpItemKindValue", { fg = "#DDE5F5", bg = "#6C8ED4" } },
	{ "CmpItemKindEnumMember", { fg = "#DDE5F5", bg = "#6C8ED4" } },

	{ "CmpItemKindInterface", { fg = "#D8EEEB", bg = "#58B5A8" } },
	{ "CmpItemKindColor", { fg = "#D8EEEB", bg = "#58B5A8" } },
	{ "CmpItemKindTypeParameter", { fg = "#D8EEEB", bg = "#58B5A8" } },

	{ "NvimTreeWinSeparator", { fg = "#555555" } },
}

return M
