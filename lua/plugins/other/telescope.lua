local M = { "nvim-telescope/telescope.nvim" }

M.dependencies = { "nvim-lua/plenary.nvim" }
M.tag = "0.1.8"

M.opts = function()
	local actions = require("telescope.actions")
	return {
		defaults = {
			preview = {
				treesitter = false,
			},

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
				"--hidden",
				"--ignore-file",
				"/home/i0i/.config/nvim/ignore.files",
			},

			file_ignore_patterns = {
				"node_modules",
				"package-lock.json",
				"\\.git",
				"dist",
				"env",
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
				border = true,
				hidden = false,
			},
			grep_string = {
				border = true,
				hidden = true,
			},
			find_files = {
				sorting_strategy = "descending",
				previewer = false,
				border = true,
				prompt_title = "~ Files ~",
				hidden = true,

				layout_config = {
					horizontal = {
						prompt_position = "bottom",
					},
					width = 0.45,
					height = 0.35,
				},
			},
			buffers = {
				prompt_title = "~ Buffers ~",
				previewer = false,

				layout_config = {
					horizontal = {
						prompt_position = "bottom",
					},
					width = 0.45,
					height = 0.35,
				},
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
		},
	}
end

M.keys = function()
	local builtin = require("telescope.builtin")

	return {
		{ "<C-f>", builtin.find_files, {} },
		{ "tb", builtin.buffers, {} },
		{ "", builtin.live_grep, {} },
		{
			"",
			function()
				vim.cmd.norm("")
				local text = Utils.get_visual_selection()
				require("telescope.builtin").grep_string({ search = text })
			end,
			mode = { "v", "o", "x" },
			{},
		},
		{
			"tiw",
			function()
				local word = vim.fn.expand("<cword>")
				builtin.grep_string({ search = word })
			end,
			{},
		},
		{
			"tiW",
			function()
				local word = vim.fn.expand("<cWORD>")
				builtin.grep_string({ search = word })
			end,
			{},
		},
		{ "z=", builtin.spell_suggest, {} },
		{
			"ts",
			function()
				local text = vim.fn.input("Grep -> ")
				if text == "" then
					return
				end
				builtin.grep_string({ search = text })
			end,
		},
		{
			"td",
			require("telescope.builtin").diagnostics,
			desc = "Lsp diagnostics",
		},
		{ "tr", builtin.registers, {} },
		{ "th", builtin.help_tags, {} },
		{ "tk", builtin.keymaps, {} },
	}
end

return M
