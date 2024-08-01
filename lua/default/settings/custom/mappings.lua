require(Utils .. "bind")

local opts = { noremap = true, silent = true }

Bind({
	["n"] = {
		-- Toggle paste mode
		["<leader>tp"] = {
			function()
				vim.opt.paste = not vim.opt.paste._value
			end,
			desc = "Toggle paste mode",
		},

		-- Movement
		["<C-d>"] = { "<C-d>zz" },
		["<C-u>"] = { "<C-u>zz" },
		["n"] = { "nzzzv" },
		["N"] = { "Nzzzv" },

		-- Wrap
		["<leader>tw"] = {
			function()
				vim.opt.wrap = not vim.opt.wrap._value
			end,
			opts,
			desc = "Toggle wrap",
		},

		-- Netrw
		["<leader>n"] = { "<cmd>Ex<cr>", opts, desc = "Toggle netrw" },

		-- Rename
		["<leader>r"] = { ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", desc = "Replace word" },

		-- Turn off search highlight
		["<leader><leader>"] = { "<cmd>nohlsearch<cr>", opts, desc = "Turn off search highlight" },

		-- Remove <C-w>
		["<C-w>"] = { "<nop>", opts },
		["<leader>w"] = { "<C-w>", opts, desc = "Window mode" },

		-- Split
		["<leader>ws"] = { "<cmd>split<cr><C-w>j", opts, desc = "Split horizontal window" },
		["<leader>wv"] = { "<cmd>vsplit<cr><C-w>l", opts, desc = "Split vertical window" },
		["<leader>wS"] = { ":split ", desc = "Split horizontal window with current file" },
		["<leader>wV"] = { ":vsplit ", desc = "Split vertical window with current file" },

		["<leader>h"] = { "<C-w>h", opts, desc = "Move to left window" },
		["<leader>j"] = { "<C-w>j", opts, desc = "Move to down window" },
		["<leader>k"] = { "<C-w>k", opts, desc = "Move to up window" },
		["<leader>l"] = { "<C-w>l", opts, desc = "Move to right window" },

		-- Tabs
		["<leader>wt"] = { "<cmd>tabnew<cr>", opts, desc = "Create a new tab" },
		["<leader>wT"] = { ":tabnew ", desc = "Create a new tab with current file" },
		["<leader>wc"] = { "<cmd>wa<cr><cmd>tabclose<cr>", opts, desc = "Close current tabs" },
		["<leader>wC"] = { "<cmd>tabclose<cr>", opts, desc = "Close current tabs (without saving)" },

		["]t"] = { "<cmd>tabnext<cr>", opts, desc = "Next tab" },
		["[t"] = { "<cmd>tabprevious<cr>", opts, desc = "Previous tab" },

		-- Buffers
		["]b"] = { "<cmd>bn<cr>", opts, desc = "Next buffer" },
		["[b"] = { "<cmd>bp<cr>", opts, desc = "Previous buffer" },
		["<leader>q"] = { "<cmd>bdelete<cr>", opts, desc = "Close buffer" },

		-- Resizing
		["<C-left>"] = { "<cmd>vertical resize -2<cr>", opts },
		["<C-right>"] = { "<cmd>vertical resize +2<cr>", opts },
		["<C-up>"] = { "<cmd>resize +2<cr>", opts },
		["<C-down>"] = { "<cmd>resize -2<cr>", opts },
		["<leader>wm"] = { "<C-w>|<C-w>_", opts, desc = "Maximize window" },
		["<leader>w="] = { "<C-w>=", opts, desc = "Equalize window" },

		-- QFix
		["<leader>co"] = { "<cmd>copen<cr>", opts, desc = "Open qfix" },
		["<leader>cc"] = { "<cmd>cclose<cr>", opts, desc = "Close qfix" },
		["<leader>cn"] = { "<cmd>cnext<cr>", opts, desc = "Next qfix" },
		["<leader>cp"] = { "<cmd>cprevious<cr>", opts, desc = "Previous qfix" },
	},

	["i"] = {
		["jk"] = { "<Esc>" },

		-- Insert Enter
		["<C-b>"] = { "<cmd>norm dwa<cr>", opts },
		["<C-/>"] = { "<cmd>norm gcc<cr>", opts },
		["<C-j>"] = { "<cmd>norm o <cr>", opts },
		["<C-k>"] = { "<cmd>norm O <cr>", opts },
	},

	["ic"] = {
		["<C-h>"] = { "<C-Left>", opts },
		["<C-l>"] = { "<C-Right>", opts },
		["<A-h>"] = { "<left>", opts },
		["<A-l>"] = { "<right>", opts },
		["<A-k>"] = { "<up>", opts },
		["<A-j>"] = { "<down>", opts },
	},

	["v"] = {
		-- Move strings
		["K"] = { ":m '<-2<cr>gv=gv", opts },
		["J"] = { ":m '>+1<cr>gv=gv", opts },

		-- Normal
		["n"] = { ":norm " },

		-- Not yank
		["x"] = { '"_x' },
		["X"] = { '"_X' },
		["s"] = { '"_s' },
		["S"] = { '"_S' },

		-- Move tabs
		["<"] = { "<gv" },
		[">"] = { ">gv" },
	},

	["x"] = {
		-- Paste
		["p"] = { '"_dP' },
		["P"] = { '""p' },
	},

	["vni"] = {
		-- Save
		["<C-s>"] = { "<cmd>w<cr><Esc>", opts },
	},
})

-- Run
autocmd("BufRead", {
	pattern = "*.js",
	callback = function()
		Bind({
			["n"] = {
				["<leader>fr"] = { "<cmd>w<cr><cmd>exec '!node' shellescape(@%, 1)<cr>", opts, desc = "Run node" },
			},
		})
	end,
})

autocmd("BufRead", {
	pattern = "*.py",
	callback = function()
		Bind({
			["n"] = {
				["<leader>fr"] = {
					"<cmd>w<cr><cmd>exec '!python3.11' shellescape(@%, 1)<cr>",
					opts,
					desc = "Run python",
				},
			},
		})
	end,
})

-- Zenmode

Bind({
	["n"] = {
		["<plugleader>zo"] = { "<cmd>ZenmodeOpen<cr>", opts, desc = "Open zenmode for current tab" },
		["<plugleader>zao"] = { "<cmd>ZenmodeOpenAll<cr>", opts, desc = "Open zenmode for all tabs" },
		["<plugleader>zc"] = { "<cmd>ZenmodeClose<cr>", opts, desc = "Close zenmode for current tab" },
		["<plugleader>zac"] = { "<cmd>ZenmodeCloseAll<cr>", opts, desc = "Close zenmode for all tabs" },
		["<plugleader>zt"] = { "<cmd>ZenmodeToggle<cr>", opts, desc = "Toggle zenmode" },
	},
})
