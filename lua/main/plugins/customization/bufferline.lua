local M = {
	"akinsho/bufferline.nvim",
	event = "VeryLazy",
	dependencies = {
		{ "nvim-tree/nvim-web-devicons" },
		{ "tiagovla/scope.nvim" },
	},
}

function M.config()
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

	local bufferline = require("bufferline")

	Bind({
		["n"] = {
			["<plugleader>m1"] = { "<cmd>ScopeMoveBuf 1<cr>", opts },
			["<plugleader>m2"] = { "<cmd>ScopeMoveBuf 2<cr>", opts },
			["<plugleader>m3"] = { "<cmd>ScopeMoveBuf 3<cr>", opts },
			["<plugleader>m4"] = { "<cmd>ScopeMoveBuf 4<cr>", opts },

			["<plugleader>1"] = { "<cmd>lua require('bufferline').go_to(1, true)<cr>", opts },
			["<plugleader>2"] = { "<cmd>lua require('bufferline').go_to(2, true)<cr>", opts },
			["<plugleader>3"] = { "<cmd>lua require('bufferline').go_to(3, true)<cr>", opts },
			["<plugleader>4"] = { "<cmd>lua require('bufferline').go_to(4, true)<cr>", opts },
			["<plugleader>5"] = { "<cmd>lua require('bufferline').go_to(5, true)<cr>", opts },
			["<plugleader>6"] = { "<cmd>lua require('bufferline').go_to(6, true)<cr>", opts },
			["<plugleader>7"] = { "<cmd>lua require('bufferline').go_to(7, true)<cr>", opts },
			["<plugleader>8"] = { "<cmd>lua require('bufferline').go_to(8, true)<cr>", opts },
			["<plugleader>9"] = { "<cmd>lua require('bufferline').go_to(9, true)<cr>", opts },
			["<plugleader>$"] = { "<cmd>lua require('bufferline').go_to(-1, true)<cr>", opts },

			-- TODO fix this
			-- ["<C-w>t"] = { "<cmd>tabnew<cr><cmd>Bdelete<cr><cmd>OpenVeil<cr>", opts },
		},
	})

	-- Create tab

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

return M
