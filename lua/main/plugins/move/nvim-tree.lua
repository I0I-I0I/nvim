local M = {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	cmd = { "NvimTreeOpen", "NvimTreeToggle", "NvimTreeClose" },
	event = "VeryLazy",
}

M.init = function()
	vim.g.loaded_netrw = 1
	vim.g.loaded_netrwPlugin = 1
	vim.opt.termguicolors = true
end

local function my_on_attach(bufnr)
	local api = require("nvim-tree.api")

	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	api.config.mappings.default_on_attach(bufnr)

	Bind({
		["n"] = {
			["?"] = { api.tree.toggle_help, opts("Help") },
			["-"] = {
				function()
					vim.cmd("cd ..")
					api.tree.change_root_to_parent()
				end,
				opts("Up"),
			},
		},
	})
end

M.opts = {
	on_attach = my_on_attach,
	hijack_cursor = true,
	auto_reload_on_write = true,
	select_prompts = true,
	view = {
		centralize_selection = true,
		width = 35,
	},

	filters = {
		dotfiles = false,
		git_clean = false,
		no_buffer = false,
		custom = { "node_modules", "\\.git$" },
	},

	renderer = {
		add_trailing = false,
		group_empty = false,
		full_name = false,
		root_folder_label = ":~:s?$?/..?",
		indent_width = 2,
		special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
		symlink_destination = true,
		highlight_git = "none",
		highlight_diagnostics = "none",
		highlight_opened_files = "none",
		highlight_modified = "none",
		highlight_hidden = "none",
		highlight_bookmarks = "none",
		highlight_clipboard = "name",
		indent_markers = {
			enable = true,
			inline_arrows = false,
			icons = {
				corner = "└",
				edge = "│",
				item = "│",
				bottom = "─",
				none = " ",
			},
		},
		icons = {
			web_devicons = {
				file = {
					enable = true,
					color = true,
				},
				folder = {
					enable = false,
					color = true,
				},
			},
			git_placement = "after",
			modified_placement = "before",
			hidden_placement = "after",
			diagnostics_placement = "signcolumn",
			bookmarks_placement = "after",
			padding = " ",
			symlink_arrow = " ➛ ",
			show = {
				file = true,
				folder = true,
				folder_arrow = true,
				git = true,
				modified = true,
				hidden = true,
				diagnostics = true,
				bookmarks = true,
			},
			glyphs = {
				default = "󰈚",
				folder = {
					default = "",
					empty = "",
					empty_open = "",
					open = "",
					symlink = "",
				},
				symlink = "",
				bookmark = "󰆤",
				modified = "★",
				hidden = "󰜌",
				git = {
					deleted = "  ",
					renamed = "  ",
					untracked = " ", -- 
					ignored = "",
					unstaged = "󰄱",
					staged = "",
					unmerged = "",
				},
			},
		},
	},
	hijack_directories = {
		enable = true,
		auto_open = true,
	},
	update_focused_file = {
		enable = true,
		update_root = {
			enable = false,
			ignore_list = {},
		},
		exclude = false,
	},
	git = {
		enable = false,
		show_on_dirs = true,
		show_on_open_dirs = false,
		disable_for_dirs = {},
		timeout = 400,
		cygwin_support = false,
	},
	diagnostics = {
		enable = true,
		show_on_dirs = true,
		show_on_open_dirs = false,
		debounce_delay = 50,
		severity = {
			min = vim.diagnostic.severity.HINT,
			max = vim.diagnostic.severity.ERROR,
		},
		icons = {
			hint = LspIcons.hint,
			info = LspIcons.info,
			error = LspIcons.error,
			warning = LspIcons.warn,
		},
	},
	modified = {
		enable = true,
		show_on_dirs = false,
		show_on_open_dirs = false,
	},
	tab = {
		sync = {
			open = true,
			close = true,
			ignore = {},
		},
	},
	filesystem_watchers = {
		ignore_dirs = { "node_modules", ".git", "build", "dist" },
	},
	actions = {
		expand_all = {
			exclude = { ".git", "build", "dist", "node_modules" },
		},
	},
}

M.keys = {
	{
		"<leader>n",
		"<cmd>NvimTreeToggle .<cr>",
		{ silent = true, noremap = true },
		desc = "Open NvimTree",
	},
}

return M
