local M = {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
	},
}

function M.config()
	local builtin = require("telescope.builtin")
	local actions = require("telescope.actions")

	Bind({
		["n"] = {
			["<plugleader>ff"] = { builtin.find_files, {} },
			["<plugleader>fw"] = { builtin.live_grep, {} },
			["<plugleader>fb"] = { builtin.buffers, {} },
			["<plugleader>fab"] = { "<cmd>M scope buffers<cr>", { silent = true } },
			["<plugleader>ft"] = { "<cmd>Colors 1<cr>", { silent = true, noremap = true } },
			["<plugleader>fat"] = { "<cmd>Colors 0.73<cr>", { silent = true, noremap = true } },
			["<plugleader>fh"] = { builtin.help_tags, {} },
			["<plugleader>fk"] = { builtin.keymaps, {} },
			["<plugleader>fR"] = { builtin.registers, {} },
			["z="] = { builtin.spell_suggest, {} },
			["<plugleader>fs"] = {
				function()
					builtin.grep_string({ search = vim.fn.input("Grep -> ") })
				end,
			},
		},
	})

	local opts = {
		defaults = {
			prompt_prefix = "  ",
			selection_caret = "  ",
			-- selection_caret = "  ",

			vimgrep_arguments = {
				"rg",
				"--color=never",
				"--no-heading",
				"--with-filename",
				"--line-number",
				"--column",
				"--smart-case",
				"--ignore-file",
				"/home/i0i/.config/nvim/ignore.files",
			},
			file_ignore_patterns = {
				"package-lock.json",
				"node_modules",
				".git",
				"dist",
			},
			mappings = {
				i = {
					["<C-j>"] = actions.cycle_history_next,
					["<C-k>"] = actions.cycle_history_prev,
					["<C-n>"] = actions.move_selection_next,
					["<C-p>"] = actions.move_selection_previous,
					["<C-d>"] = actions.delete_buffer,
				},
				n = {
					["esc"] = actions.close,
					["q"] = actions.close,
					["j"] = actions.move_selection_next,
					["k"] = actions.move_selection_previous,
					["dd"] = actions.delete_buffer,
				},
			},
		},

		pickers = {
			live_grep = {
				prompt_title = "~ Words ~",
				theme = "ivy",
				border = true,
			},
			grep_string = {
				theme = "ivy",
				border = true,
			},
			find_files = {
				theme = "dropdown",
				previewer = false,
				border = true,
				prompt_title = "~ Files ~",
				shorten_path = false,
			},
			buffers = {
				theme = "dropdown",
				prompt_title = "~ Buffers ~",
				previewer = false,
				initial_mode = "normal",
			},
			registers = {
				theme = "cursor",
				previewer = true,
				prompt_title = "",
			},
			spell_suggest = {
				theme = "cursor",
				previewer = false,
			},
			colorscheme = {
				prompt_title = "~ Colorcheme ~",
				enable_preview = true,
				border = false,
				layout_config = {
					preview_width = 0.7,
					horizontal = {
						prompt_position = "top",
					},
				},
			},
			lsp_references = {
				theme = "ivy",
			},
			lsp_definitions = {
				theme = "ivy",
			},
		},
	}
	require("telescope").setup(opts)
	require("telescope").load_extension("scope")
	require("telescope").load_extension("notify")

	require(Theme_utils .. "telescope_theme")
end

return M
