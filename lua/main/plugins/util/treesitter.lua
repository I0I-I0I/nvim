return {
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
			"windwp/nvim-ts-autotag",
		},
		build = ":TSUpdate",
		event = { "BufRead", "BufNewFile" },
		init = function(plugin)
			require("lazy.core.loader").add_to_rtp(plugin)
			require("nvim-treesitter.query_predicates")
		end,
		cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },

		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
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
				},

				sync_install = false,
				auto_install = true,

				highlight = {
					enable = true,
				},

				indent = {
					enable = true,
				},

				autotag = {
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

				textobjects = {
					select = {
						enable = true,
						lookahead = true,
						keymaps = {
							-- assignment
							["a="] = { query = "@assignment.outer", desc = "Select outer part of an assignment" },
							["i="] = { query = "@assignment.inner", desc = "Select inner part of an assignment" },
							["v="] = { query = "@assignment.lhs", desc = "Select left hand side of an assignment" },
							["r="] = { query = "@assignment.rhs", desc = "Select right hand side of an assignment" },

							-- parameters
							["aa"] = { query = "@parameter.outer", desc = "Select outer part of a parameter/argument" },
							["ia"] = { query = "@parameter.inner", desc = "Select inner part of a parameter/argument" },

							-- conditional
							["ai"] = { query = "@conditional.outer", desc = "Select outer part of a conditional" },
							["ii"] = { query = "@conditional.inner", desc = "Select inner part of a conditional" },

							-- loops
							["al"] = { query = "@loop.outer", desc = "Select outer part of a loop" },
							["il"] = { query = "@loop.inner", desc = "Select inner part of a loop" },

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

							-- number
							["in"] = { query = "@number.inner", desc = "Select inner part of a number" },
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
				},
			})

			local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")

			vim.keymap.set("n", ">", ts_repeat_move.repeat_last_move)
			vim.keymap.set("n", "<", ts_repeat_move.repeat_last_move_opposite)

			-- Optionally, make builtin f, F, t, T also repeatable with ; and ,
			-- vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f)
			-- vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F)
			-- vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t)
			-- vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T)
		end,
	},
}
