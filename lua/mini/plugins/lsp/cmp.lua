local M = {
	"hrsh7th/nvim-cmp",
	dependencies = {
		{ "hrsh7th/cmp-nvim-lsp" },
		-- { "hrsh7th/cmp-path" },
		{
			"saadparwaiz1/cmp_luasnip",
			dependencies = {
				{ "L3MON4D3/LuaSnip", version = "v2.*", build = "make install_jsregexp" },
				{ "rafamadriz/friendly-snippets" },
			},
		},
	},
	event = { "BufRead" },
}

function M.config()
	local cmp = require("cmp")

	local ls = require("luasnip")

	vim.keymap.set({ "i", "s" }, "<A-j>", function()
		ls.jump(1)
	end, { silent = true })
	vim.keymap.set({ "i", "s" }, "<A-k>", function()
		ls.jump(-1)
	end, { silent = true })

	require("luasnip.loaders.from_vscode").lazy_load()

	cmp.setup({
		window = {
			completion = cmp.config.window.bordered(),
			documentation = cmp.config.window.bordered(),
		},
		mapping = cmp.mapping.preset.insert({
			["<C-b>"] = cmp.mapping.scroll_docs(-4),
			["<C-f>"] = cmp.mapping.scroll_docs(4),
			["<C-e>"] = cmp.mapping.abort(),
			["<CR>"] = cmp.mapping.confirm({ select = true }),
		}),
		snippet = {
			expand = function(args)
				require("luasnip").lsp_expand(args.body)
			end,
		},
		sources = cmp.config.sources({
			{ name = "luasnip" },
			{ name = "nvim_lsp" },
			-- { name = "cmp-path" },
		}),
		formatting = {
			format = function(_, vim_item)
				vim_item.kind = string.format("%s (%s)", "", vim_item.kind)
				return vim_item
			end,
		},
	})
end

return M
