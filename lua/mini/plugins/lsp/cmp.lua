local M = {
	"hrsh7th/nvim-cmp",
	dependencies = {
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "hrsh7th/cmp-cmdline" },
		{ "hrsh7th/cmp-buffer" },
		{ "hrsh7th/cmp-path" },
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

	require("luasnip.loaders.from_vscode").lazy_load()

	vim.keymap.set({ "i", "s" }, "<A-n>", function()
		ls.jump(1)
	end, { silent = true })
	vim.keymap.set({ "i", "s" }, "<A-p>", function()
		ls.jump(-1)
	end, { silent = true })

	cmp.setup({
		window = {
			cmp.config.window.bordered(),
			completion = {
				border = nil,
				col_offset = -3,
				side_padding = 1,
				scrollbar = false,
				scrolloff = 3,
			},
			documentation = {
				border = nil,
				col_offset = -3,
				side_padding = 1,
				scrollbar = true,
				scrolloff = 3,
			},
		},
		mapping = cmp.mapping.preset.insert({
			["<C-b>"] = cmp.mapping.scroll_docs(-4),
			["<C-f>"] = cmp.mapping.scroll_docs(4),
			["<C-Space>"] = cmp.mapping.complete(),
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
			{ name = "buffer", keyword_length = 3 },
		}, {
			{ name = "cmp-path" },
		}),
		formatting = {
			format = function(entry, vim_item)
				vim_item.kind = string.format("%s (%s)", "", vim_item.kind)
				return vim_item
			end,
		},
	})

	cmp.setup.cmdline({ "/", "?" }, {
		mapping = cmp.mapping.preset.cmdline(),
		sources = {
			{ name = "buffer" },
		},
	})

	cmp.setup.cmdline(":", {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
			{ name = "path" },
		}, {
			{ name = "cmdline" },
		}),
		matching = { disallow_symbol_nonprefix_matching = false },
	})
end

return M
