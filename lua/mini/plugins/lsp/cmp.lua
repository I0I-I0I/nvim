local M = {
	"hrsh7th/nvim-cmp",
	dependencies = {
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "hrsh7th/cmp-cmdline" },
		{ "hrsh7th/cmp-buffer" },
		{ "hrsh7th/cmp-path" },
	},
	event = { "BufRead" },
}

function M.config()
	local cmp = require("cmp")

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
		sources = cmp.config.sources({
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
