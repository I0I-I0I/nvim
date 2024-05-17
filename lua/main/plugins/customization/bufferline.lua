local bufferline = {
	"akinsho/bufferline.nvim",
	event = "VeryLazy", -- BufFilePre
	version = "*",
	dependencies = {
		{ "nvim-tree/nvim-web-devicons" },
		{
			"tiagovla/scope.nvim",
			lazy = false,
			event = "VimEnter",
		},
	},
}

function bufferline.config()
	local bufferline = require("bufferline")
	local scope = require("scope")

	vim.keymap.set("n", "<leader>1", "<cmd>lua require('bufferline').go_to(1, true)<cr>")
	vim.keymap.set("n", "<leader>2", "<cmd>lua require('bufferline').go_to(2, true)<cr>")
	vim.keymap.set("n", "<leader>3", "<cmd>lua require('bufferline').go_to(3, true)<cr>")
	vim.keymap.set("n", "<leader>4", "<cmd>lua require('bufferline').go_to(4, true)<cr>")
	vim.keymap.set("n", "<leader>5", "<cmd>lua require('bufferline').go_to(5, true)<cr>")
	vim.keymap.set("n", "<leader>6", "<cmd>lua require('bufferline').go_to(6, true)<cr>")
	vim.keymap.set("n", "<leader>7", "<cmd>lua require('bufferline').go_to(7, true)<cr>")
	vim.keymap.set("n", "<leader>8", "<cmd>lua require('bufferline').go_to(8, true)<cr>")
	vim.keymap.set("n", "<leader>9", "<cmd>lua require('bufferline').go_to(9, true)<cr>")
	vim.keymap.set("n", "<leader>$", "<cmd>lua require('bufferline').go_to(-1, true)<cr>")

	-- Move buffers
	vim.keymap.set("n", "]b", "<cmd>BufferLineMoveNext<cr>")
	vim.keymap.set("n", "[b", "<cmd>BufferLineMovePrev<cr>")

	-- Move by buffers
	vim.keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<cr>")
	vim.keymap.set("n", "<C-Tab>", "<cmd>BufferLineCyclePrev<cr>")

	-- Create tab
	vim.keymap.set("n", "<C-w>t", "<cmd>tabnew<cr><cmd>Bdelete<cr><cmd>OpenVeil<cr>")

	-- Move by tabs
	vim.keymap.set("n", "<leader><Tab>", "<cmd>tabnext<cr>")
	vim.keymap.set("n", "<leader><C-Tab>", "<cmd>tabprevious<cr>")

	scope.setup({})
	bufferline.setup({
		options = {
			mode = "buffers", -- "tabs", "buffers"
			always_show_bufferline = true,
			show_buffer_close_icons = false,
			show_close_icon = false,
			color_icons = true,
			offsets = {
				{
					filetype = "neo-tree",
					text = "File Explorer",
					text_align = "center",
					padding = 0,
					separator = true,
				},
			},
			numbers = "ordinal",
			separator_style = "thin",
			style_preset = bufferline.style_preset.minimal, -- or bufferline.style_preset.minimal,
			diagnostics = "nvim_lsp",
			diagnostics_indicator = function(count, level, diagnostics_dict, context)
				local s = " "
				for e, n in pairs(diagnostics_dict) do
					local sym = e == "error" and "   " or (e == "warning" and "   " or "   ")
					s = s .. sym .. n
				end
				return s
			end,
		},
	})
end

return bufferline
