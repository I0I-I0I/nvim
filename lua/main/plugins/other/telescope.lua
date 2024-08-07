local M = {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	lazy = true,
}

M.builtin = require("telescope.builtin")

function M.config()
	local actions = require("telescope.actions")

	local opts = {
		defaults = {
			prompt_prefix = "  ",
			selection_caret = " ",

			sorting_strategy = "ascending",
			layout_config = {
				horizontal = {
					prompt_position = "top",
					preview_width = 0.55,
				},
				width = 0.87,
				height = 0.80,
			},
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
				"\\.git",
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
			-- lsp_references = {
			-- 	theme = "ivy",
			-- },
			-- lsp_definitions = {
			-- 	theme = "ivy",
			-- },
		},

		extensions = {
			fzf = {
				fuzzy = true, -- false will only do exact matching
				override_generic_sorter = true, -- override the generic sorter
				override_file_sorter = true, -- override the file sorter
				case_mode = "smart_case", -- or "ignore_case" or "respect_case"
				-- the default case_mode is "smart_case"
			},
		},
	}

	require("telescope").setup(opts)
	require("telescope").load_extension("scope")
	require("telescope").load_extension("notify")
	require("telescope").load_extension("fzf")
end

local get_visual_selection = require("default.utils").get_visual_selection

M.keys = {
	{ "<leader>ff", M.builtin.find_files, desc = "Files" },
	{ "<leader>fb", M.builtin.buffers, desc = "Buffers" },
	{ "<leader>fab", "<cmd>Telescope scope buffers<cr>", { silent = true }, desc = "All Buffers" },
	{ "<leader>fh", M.builtin.help_tags, desc = "Help Tags" },
	{ "<leader>fk", M.builtin.keymaps, desc = "Keymaps" },
	{ "<leader>fR", M.builtin.registers, desc = "Registers" },
	{ "z=", M.builtin.spell_suggest, desc = "Spell Suggest" },
	{
		"<leader>fs",
		function()
            local text = vim.fn.input("Grep -> ")
            if text == "" then
                return
            end
			M.builtin.grep_string({ search = text })
		end,
		desc = "Grep String",
	},
	{ "<leader>fw", M.builtin.live_grep, desc = "Live Grep" },
	{
		"<leader>fw",
		function()
			vim.cmd.norm("")
			local text = get_visual_selection()
			require("telescope.builtin").grep_string({ search = text, prompt_title = "Search By Selection" })
		end,
		mode = { "v", "o", "x" },
		{},
	},
	{
		"<leader>fiw",
		function()
			local word = vim.fn.expand("<cword>")
			M.builtin.grep_string({ search = word })
		end,
		{},
	},
	{
		"<leader>faw",
		function()
			local word = vim.fn.expand("<cWORD>")
			M.builtin.grep_string({ search = word })
		end,
		{},
	},
}

return M
