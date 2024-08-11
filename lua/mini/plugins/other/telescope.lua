local M = {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = { "nvim-lua/plenary.nvim" },
}

-- function M.init()
-- require("telescope").load_extension("scope")
-- end

M.opts = function()
	local actions = require("telescope.actions")

	return {
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
				-- theme = "ivy",
				border = true,
			},
			grep_string = {
				-- theme = "ivy",
				border = true,
			},
			find_files = {
				previewer = false,
				border = true,
				prompt_title = "~ Files ~",
				shorten_path = true,

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
				initial_mode = "normal",

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
			-- lsp_references = {
			-- 	theme = "ivy",
			-- },
			-- lsp_definitions = {
			-- 	theme = "ivy",
			-- },
		},
	}
end

M.keys = function()
	local builtin = require("telescope.builtin")
	local get_visual_selection = require("default.utils").get_visual_selection

	return {
		{ "<leader>ff", builtin.find_files, {} },
		{ "<leader>fb", builtin.buffers, {} },
		{ "<leader>fab", "<cmd>Telescope scope buffers<cr>", { silent = true } },
		{ "<leader>fh", builtin.help_tags, {} },
		{ "<leader>fk", builtin.keymaps, {} },
		{ "<leader>fR", builtin.registers, {} },
		{ "<leader>fw", builtin.live_grep, {} },
		{
			"<leader>fw",
			function()
				vim.cmd.norm("")
				local text = get_visual_selection()
				require("telescope.builtin").grep_string({ search = text })
			end,
			mode = { "v", "o", "x" },
			{},
		},
		{
			"<leader>fiw",
			function()
				local word = vim.fn.expand("<cword>")
				builtin.grep_string({ search = word })
			end,
			{},
		},
		{
			"<leader>faw",
			function()
				local word = vim.fn.expand("<cWORD>")
				builtin.grep_string({ search = word })
			end,
			{},
		},
		{ "z=", builtin.spell_suggest, {} },
		{
			"<leader>fs",
			function()
				local text = vim.fn.input("Grep -> ")
				if text == "" then
					return
				end
				builtin.grep_string({ search = text })
			end,
		},
	}
end

return M
