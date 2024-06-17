local Bufferline = {
	"akinsho/bufferline.nvim",
	event = "VeryLazy",
	dependencies = {
		{ "nvim-tree/nvim-web-devicons" },
		{ "tiagovla/scope.nvim" },
	},
}

function Bufferline.config()
	local opts = { silent = true, noremap = true }

	--
	-- Scope
	--
	local scope = require("scope")

	vim.opt.sessionoptions = {
		"buffers",
		"tabpages",
		"globals",
	}

	scope.setup({})

	vim.keymap.set("n", "<leader>m1", "<cmd>ScopeMoveBuf 1<cr>", opts)
	vim.keymap.set("n", "<leader>m2", "<cmd>ScopeMoveBuf 2<cr>", opts)
	vim.keymap.set("n", "<leader>m3", "<cmd>ScopeMoveBuf 3<cr>", opts)
	vim.keymap.set("n", "<leader>m4", "<cmd>ScopeMoveBuf 4<cr>", opts)

	--
	-- BufferLine
	--
	local bufferline = require("bufferline")

	vim.keymap.set("n", "<leader>1", "<cmd>lua require('bufferline').go_to(1, true)<cr>", opts)
	vim.keymap.set("n", "<leader>2", "<cmd>lua require('bufferline').go_to(2, true)<cr>", opts)
	vim.keymap.set("n", "<leader>3", "<cmd>lua require('bufferline').go_to(3, true)<cr>", opts)
	vim.keymap.set("n", "<leader>4", "<cmd>lua require('bufferline').go_to(4, true)<cr>", opts)
	vim.keymap.set("n", "<leader>5", "<cmd>lua require('bufferline').go_to(5, true)<cr>", opts)
	vim.keymap.set("n", "<leader>6", "<cmd>lua require('bufferline').go_to(6, true)<cr>", opts)
	vim.keymap.set("n", "<leader>7", "<cmd>lua require('bufferline').go_to(7, true)<cr>", opts)
	vim.keymap.set("n", "<leader>8", "<cmd>lua require('bufferline').go_to(8, true)<cr>", opts)
	vim.keymap.set("n", "<leader>9", "<cmd>lua require('bufferline').go_to(9, true)<cr>", opts)
	vim.keymap.set("n", "<leader>$", "<cmd>lua require('bufferline').go_to(-1, true)<cr>", opts)

	-- Move buffers
	vim.keymap.set("n", "]b", "<cmd>BufferLineMoveNext<cr>", opts)
	vim.keymap.set("n", "[b", "<cmd>BufferLineMovePrev<cr>", opts)

	-- Move by buffers
	vim.keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<cr>", opts)
	vim.keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", opts)

	-- Create tab
	vim.keymap.set("n", "<C-w>t", "<cmd>tabnew<cr><cmd>Bdelete<cr><cmd>OpenVeil<cr>", opts)

	-- Move by tabs
	vim.keymap.set("n", "<leader><Tab>", "<cmd>tabnext<cr>", opts)
	vim.keymap.set("n", "<leader><S-Tab>", "<cmd>tabprevious<cr>", opts)

	local bufferlineLspIcons = {
		error = " " .. LspIcons.error,
		warn = " " .. LspIcons.warn,
		hint = " " .. LspIcons.hint,
		info = " " .. "󱂸 ",
	}

	bufferline.setup({
		options = {
			mode = "buffers",
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

return Bufferline
