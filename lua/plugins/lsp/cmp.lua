local M = { "hrsh7th/nvim-cmp" }

M.dependencies = {
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "saadparwaiz1/cmp_luasnip", dependencies = {
		{ "L3MON4D3/LuaSnip", version = "v2.*", build = "make install_jsregexp" },
		{ "rafamadriz/friendly-snippets" } },
	},
}

M.event = { "BufRead" }

M.config = function()
	local cmp = require("cmp")
	local ls = require("luasnip")

	require("luasnip.loaders.from_vscode").lazy_load()

	cmp.setup({
		mapping = cmp.mapping.preset.insert({
			["<C-b>"] = cmp.mapping.scroll_docs(-4),
			["<C-f>"] = cmp.mapping.scroll_docs(4),
			["<C-e>"] = cmp.mapping.abort(),
			["<C-space>"] = cmp.mapping.complete(),
			["<C-y>"] = cmp.mapping.confirm({ select = true }),
			["<CR>"] = cmp.mapping.confirm({ select = false }),

			-- Snippets
			['<Tab>'] = cmp.mapping(function(fallback)
				if ls.jumpable(1) then
					ls.jump(1)
				else
					fallback()
				end
			end, { "i", "s" }),
			['<S-Tab>'] = cmp.mapping(function(fallback)
				if ls.jumpable(-1) then
					ls.jump(-1)
				else
					fallback()
				end
			end, { "i", "s" }),
		}),
		snippet = {
			expand = function(args)
				require("luasnip").lsp_expand(args.body)
			end,
		},
		sources = cmp.config.sources({
			{ name = "nvim_lsp" },
			{ name = "luasnip" },
		}),
	})
end

return M
