local M = {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
		"windwp/nvim-ts-autotag",
	},
	build = ":TSUpdate",
	event = { "BufRead", "BufNewFile" },
}

function M.init(plugin)
	require("lazy.core.loader").add_to_rtp(plugin)
	require("nvim-treesitter.query_predicates")
end

function M.config()
	local treesitter = require("nvim-treesitter.configs")
	local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")
	local ts_autotag = require("nvim-ts-autotag")

	local installed = {
		"lua",
		"python",
		"javascript",
		"typescript",
		"tsx",
		"json",
		"html",
		"css",
		"markdown",
		"markdown_inline",
		"bash",
		"gitignore",
		"vim",
		"http",
		"xml",
		"graphql",
	}

	local textobjects = {
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				-- assignment
				["a="] = { query = "@assignment.outer", desc = "Select outer part of an assignment" },
				["i="] = { query = "@assignment.inner", desc = "Select inner part of an assignment" },
				["v="] = { query = "@assignment.lhs", desc = "Select left hand side of an assignment" },
				["r="] = { query = "@assignment.rhs", desc = "Select right hand side of an assignment" },

				-- conditional
				-- ["ai"] = { query = "@conditional.outer", desc = "Select outer part of a conditional" },
				-- ["ii"] = { query = "@conditional.inner", desc = "Select inner part of a conditional" },

				-- loops
				["aL"] = { query = "@loop.outer", desc = "Select outer part of a loop" },
				["iL"] = { query = "@loop.inner", desc = "Select inner part of a loop" },

				-- functions
				["am"] = { query = "@call.outer", desc = "Select outer part of a function call" },
				["im"] = { query = "@call.inner", desc = "Select inner part of a function call" },

				-- functions
				["af"] = {
					query = "@function.outer",
					desc = "Select outer part of a method/function definition",
				},
				["if"] = {
					query = "@function.inner",
					desc = "Select inner part of a method/function definition",
				},

				-- classes
				["ac"] = { query = "@class.outer", desc = "Select outer part of a class" },
				["ic"] = { query = "@class.inner", desc = "Select inner part of a class" },

				-- comments
				["at"] = { query = "@comment.outer", desc = "Select outer part of a comment" },

				-- HTML
				["ih"] = { query = "@attribute.inner", desc = "Select inner part of a attribute" },
				["ah"] = { query = "@attribute.outer", desc = "Select inner part of a attribute" },
			},
		},

		swap = {
			enable = true,
			swap_next = {
				["]a"] = "@parameter.inner",
			},
			swap_previous = {
				["[a"] = "@parameter.inner",
			},
		},

		move = {
			enable = true,
			set_jumps = true,
			goto_next_start = {
				["]m"] = { query = "@call.outer", desc = "Next function call start" },
				["]f"] = { query = "@function.outer", desc = "Next method/function def start" },
				["]c"] = { query = "@class.outer", desc = "Next class start" },
				["]i"] = { query = "@conditional.outer", desc = "Next conditional start" },
				["]l"] = { query = "@loop.outer", desc = "Next loop start" },

				["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
				["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },

				["]n"] = { query = "@number", desc = "Select inner part of a number" },

				-- HTML
				["]h"] = { query = "@attribute", desc = "Select inner part of a attribute" },
			},
			goto_next_end = {
				["]M"] = { query = "@call.outer", desc = "Next function call start" },
				["]F"] = { query = "@function.outer", desc = "Next method/function def start" },
				["]C"] = { query = "@class.outer", desc = "Next class start" },
				["]I"] = { query = "@conditional.outer", desc = "Next conditional start" },
				["]L"] = { query = "@loop.outer", desc = "Next loop start" },
			},
			goto_previous_start = {
				["[m"] = { query = "@call.outer", desc = "Next function call start" },
				["[f"] = { query = "@function.outer", desc = "Next method/function def start" },
				["[c"] = { query = "@class.outer", desc = "Next class start" },
				["[i"] = { query = "@conditional.outer", desc = "Next conditional start" },
				["[l"] = { query = "@loop.outer", desc = "Next loop start" },

				["[s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
				["[z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },

				["[n"] = { query = "@number", desc = "Select inner part of a number" },

				-- HTML
				["[h"] = { query = "@attribute", desc = "Select inner part of a attribute" },
			},
			goto_previous_end = {
				["[M"] = { query = "@call.outer", desc = "Next function call end" },
				["[F"] = { query = "@function.outer", desc = "Next method/function def end" },
				["[C"] = { query = "@class.outer", desc = "Next class end" },
				["[I"] = { query = "@conditional.outer", desc = "Next conditional end" },
				["[L"] = { query = "@loop.outer", desc = "Next loop end" },
			},
		},
	}

	treesitter.setup({
		ensure_installed = installed,

		sync_install = false,
		auto_install = true,

		highlight = {
			enable = true,
		},

		indent = {
			enable = true,
		},

		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "<C-space>",
				node_incremental = "<C-space>",
				scope_incremental = false,
				node_decremental = "<bs>",
			},
		},

		textobjects = textobjects,
	})

	ts_autotag.setup({
		opts = {
			enable_close = true, -- Auto close tags
			enable_rename = true, -- Auto rename pairs of tags
			enable_close_on_slash = true, -- Auto close on trailing </
		},
	})

	Bind({
		["n"] = {
			[">"] = { ts_repeat_move.repeat_last_move },
			["<"] = { ts_repeat_move.repeat_last_move_opposite },
		},
	})
end

return M
