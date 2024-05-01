local Telescope = {
	"nvim-telescope/telescope.nvim",
	cmd = "Telescope",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
		},
	},
	keys = {
		{ "<leader>f" },
	},
}

function Telescope.config()
	local builtin = require("telescope.builtin")
	local actions = require("telescope.actions")

	vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
	vim.keymap.set("n", "<leader>fw", builtin.live_grep, {})
	vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
	vim.keymap.set("n", "<leader>ft", builtin.colorscheme, {})
	vim.keymap.set("n", "<leader>fr", builtin.registers, {})
	vim.keymap.set("i", "<C-v>", builtin.registers, { noremap = true, silent = true })
	vim.keymap.set("n", "z=", builtin.spell_suggest, {})

	local opts = {
		defaults = {
			prompt_prefix = "  ",
			selection_caret = "  ",
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
				},
				n = {
					["esc"] = actions.close,
					["q"] = actions.close,
					["j"] = actions.move_selection_next,
					["k"] = actions.move_selection_previous,
				},
			},
		},

		pickers = {
			live_grep = {
				theme = "ivy",
				previewer = true,
			},
			find_files = {
				theme = "dropdown",
				previewer = false,
				border = false,
			},
			buffers = {
				theme = "dropdown",
				previewer = false,
				initial_mode = "normal",
				mappings = {
					i = {
						["<C-d>"] = actions.delete_buffer,
					},
					n = {
						["dd"] = actions.delete_buffer,
					},
				},
			},
			registers = {
				theme = "cursor",
				previewer = true,
			},
			spell_suggest = {
				theme = "cursor",
				previewer = false,
			},
			colorscheme = {
				enable_preview = true,
				border = false,
			},
			lsp_references = {
				theme = "ivy",
			},
			lsp_definitions = {
				theme = "ivy",
			},
		},
		extensions = {
			fzf = {
				fuzzy = true, -- false will only do exact matching
				override_generic_sorter = true, -- override the generic sorter
				override_file_sorter = true, -- override the file sorter
				case_mode = "smart_case", -- or "ignore_case" or "respect_case"
			},
		},
	}
	require("telescope").setup(opts)
	require("telescope").load_extension("fzf")
end

return Telescope
