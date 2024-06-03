local Cmp = {
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

function Cmp.config()
	local cmp = require("cmp")
	local lspkind = require("lspkind")
	local cmp_action = require("lsp-zero").cmp_action()

	require("luasnip.loaders.from_vscode").lazy_load()

	cmp.setup({
		snippet = {
			expand = function(args)
				require("luasnip").lsp_expand(args.body)
			end,
		},

		sources = cmp.config.sources({
			{ name = "nvim_lsp" },
			{ name = "luasnip", option = { show_autosnippets = true } },
			{ name = "nvim_lua" },
		}, {
			{ name = "path" },
			{ name = "buffer" },
		}),

		window = {
			-- cmp.config.window.bordered()
			completion = {
				border = "rounded",
				col_offset = -3,
				side_padding = 1,
				scrollbar = false,
				scrolloff = 8,
			},
			documentation = cmp.config.window.bordered(),
		},

		mapping = cmp.mapping.preset.insert({
			["<C-b>"] = cmp.mapping.scroll_docs(-4),
			["<C-f>"] = cmp.mapping.scroll_docs(4),
			["<C-e>"] = cmp.mapping.abort(),
			["<CR>"] = cmp.mapping.confirm({ select = true }),
			["<Tab>"] = cmp_action.tab_complete(),
			["<S-Tab>"] = cmp_action.select_prev_or_fallback(),
		}),

		formatting = {
			fields = { "abbr", "menu", "kind" },
			format = lspkind.cmp_format({
				mode = "symbol_text",
				show_labelDetails = true,
				-- preset = "default",
				preset = "codicons",
				ellipsis_char = "...",
				symbol_map = {
					Snippet = "",
				},
			}),
		},

		experimental = {
			ghost_text = false,
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
end

return Cmp
