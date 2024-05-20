local Telescope = {
	"nvim-telescope/telescope.nvim",
	cmd = "Telescope",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
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
	vim.keymap.set("n", "<leader>ab", "<cmd>Telescope scope buffers<cr>", { silent = true })
	vim.keymap.set("n", "<leader>b", builtin.buffers, {})
	vim.keymap.set("n", "<leader>ft", builtin.colorscheme, {})
	vim.keymap.set("n", "<leader>fr", builtin.registers, {})
	vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
	vim.keymap.set("n", "<leader>fk", builtin.keymaps, {})
	vim.keymap.set("n", "<leader>fn", "<cmd>Telescope notify<cr>", { silent = true })
	vim.keymap.set("i", "<C-v>", builtin.registers, { noremap = true, silent = true })
	vim.keymap.set("n", "z=", builtin.spell_suggest, {})
	vim.keymap.set("n", "<leader>fs", function()
		builtin.grep_string({ search = vim.fn.input("Grep -> ") })
	end)

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

return Telescope
