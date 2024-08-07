local M = {
	"akinsho/bufferline.nvim",
	event = "VeryLazy",
	dependencies = {
		{ "nvim-tree/nvim-web-devicons" },
	},
}

function M.config()
	local bufferline = require("bufferline")

	local bufferlineLspIcons = {
		error = " " .. LspIcons.error,
		warn = " " .. LspIcons.warn,
		hint = " " .. LspIcons.hint,
		info = " " .. "󱂸 ",
	}

	bufferline.setup({
		options = {
			-- mode = "buffers",
			mode = "tabs",
			always_show_bufferline = true,
			show_buffer_close_icons = false,
			show_close_icon = false,
			color_icons = true,
			indicator = {
				style = "none",
			},
			offsets = {
				{
					filetype = "neo-tree",
					text = "File Explorer",
					highlight = "Directory",
					text_align = "center",
					separator = true,
				},
				{
					filetype = "NvimTree",
					text = "File Explorer",
					highlight = "Directory",
					text_align = "center",
					separator = true,
				},
			},
			numbers = "ordinal",
			separator_style = "thin",
			style_preset = bufferline.style_preset.minimal,
			diagnostics = "nvim_lsp",
			diagnostics_indicator = function(count, level, diagnostics_dict, context)
				local s = " "
				for e, n in pairs(diagnostics_dict) do
					local sym = e == "error" and bufferlineLspIcons.error
						or (e == "warning" and bufferlineLspIcons.warn or bufferlineLspIcons.info)
					s = s .. sym .. n
				end
				return s
			end,
		},
	})
end

local opts = { silent = true, noremap = true }

M.keys = {
	{ "<leader>1", "<cmd>lua require('bufferline').go_to(1, true)<cr>", opts, desc = "Go to buffer 1" },
	{ "<leader>2", "<cmd>lua require('bufferline').go_to(2, true)<cr>", opts, desc = "Go to buffer 2" },
	{ "<leader>3", "<cmd>lua require('bufferline').go_to(3, true)<cr>", opts, desc = "Go to buffer 3" },
	{ "<leader>4", "<cmd>lua require('bufferline').go_to(4, true)<cr>", opts, desc = "Go to buffer 4" },
	{ "<leader>5", "<cmd>lua require('bufferline').go_to(5, true)<cr>", opts, desc = "Go to buffer 5" },
	{ "<leader>$", "<cmd>lua require('bufferline').go_to(-1, true)<cr>", opts, desc = "Go to last buffer" },
}

return M
