local M = {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = { "nvim-lua/plenary.nvim" },
}

function M.init()
	require("telescope").load_extension("scope")
end

M.actions = require("telescope.actions")

M.opts = {
	defaults = {
		prompt_prefix = "  ",
		selection_caret = " ",

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
				["<C-j>"] = M.actions.cycle_history_next,
				["<C-k>"] = M.actions.cycle_history_prev,
				["<C-n>"] = M.actions.move_selection_next,
				["<C-p>"] = M.actions.move_selection_previous,
				["<C-d>"] = M.actions.delete_buffer,
			},
			n = {
				["esc"] = M.actions.close,
				["q"] = M.actions.close,
				["j"] = M.actions.move_selection_next,
				["k"] = M.actions.move_selection_previous,
				["dd"] = M.actions.delete_buffer,
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

M.builtin = require("telescope.builtin")
local get_visual_selection = require("default.utils").get_visual_selection

M.keys = {
	{ "<leader>ff", M.builtin.find_files, {} },
	{ "<leader>fb", M.builtin.buffers, {} },
	{ "<leader>fab", "<cmd>Telescope scope buffers<cr>", { silent = true } },
	{ "<leader>fh", M.builtin.help_tags, {} },
	{ "<leader>fk", M.builtin.keymaps, {} },
	{ "<leader>fR", M.builtin.registers, {} },
	{ "<leader>fw", M.builtin.live_grep, {} },
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
	{ "z=", M.builtin.spell_suggest, {} },
	{
		"<leader>fs",
		function()
            local text = vim.fn.input("Grep -> ")
            if text == "" then
                return
            end
			M.builtin.grep_string({ search = text })
		end,
	},
}

return M
