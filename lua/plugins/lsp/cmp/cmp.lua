local cmp = require("cmp")
local lspkind = require("lspkind")
local cmp_action = require("lsp-zero").cmp_action()

-- VSCode
require("luasnip.loaders.from_vscode").load()

cmp.setup({
	preselect = "item",
	completion = {
		-- autocomplete = false,
		completeopt = "menu,menuone,noinsert",
	},

	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},

	sources = cmp.config.sources({
		-- { name = "lab.quick_data", keyword_length = 4 },
		{ name = "luasnip" },
		-- { name = "codeium" },
		{ name = "nvim_lsp" },
	}, {
		{ name = "buffer" },
		{ name = "path" },
	}),

	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},

	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<cr>"] = cmp.mapping.confirm({ select = true }),
		["<Tab>"] = cmp_action.luasnip_supertab(),
		["<S-Tab>"] = cmp_action.luasnip_shift_supertab(),
	}),

	formatting = {
		fields = { "kind", "abbr", "menu" },
		-- fields = { "menu", "abbr", "kind" },

		format = function(entry, item)
			local menu_icon = {
				codeium = "[CDM]",
				cmp_tabnine = "[TN]",
				nvim_lsp = "λ",
				luasnip = "⋗",
				buffer = "Ω",
				path = "🖫",
				nvim_lua = "Π",
			}

			item.kind = lspkind.symbolic(item.kind, { mode = "symbol" })
			item.menu = menu_icon[entry.source.name]

			if entry.source.name == "codeium" then
				local detail = (entry.completion_item.labelDetails or {}).detail
				item.kind = ""
				if detail and detail:find(".*%%.*") then
					item.kind = item.kind .. " " .. detail
				end

				if (entry.completion_item.data or {}).multiline then
					item.kind = item.kind .. " " .. "[ML]"
				end
			end

			local maxwidth = 80
			item.abbr = string.sub(item.abbr, 1, maxwidth)
			return item
		end,
	},
})

-- Set configuration for specific filetype.
cmp.setup.filetype("gitcommit", {
	sources = cmp.config.sources({
		{ name = "git" }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
	}, {
		{ name = "buffer" },
	}),
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ "/", "?" }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
		{ name = "path" },
	},
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})
