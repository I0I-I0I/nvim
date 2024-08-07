local opts = { noremap = true, silent = true }

Bind({
	["n"] = {
		-- Toggle paste mode
		["<localleader>tp"] = {
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
		["<localleader>tw"] = {
			function()
				vim.opt.wrap = not vim.opt.wrap._value
			end,
			opts,
			desc = "Toggle wrap",
		},

		-- Netrw
		["<localleader>n"] = { "<cmd>Ex<cr>", opts, desc = "Toggle netrw" },

		-- Rename
		["<localleader>r"] = { ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", desc = "Replace word" },

		-- Turn off search highlight
		["<localleader><localleader>"] = { "<cmd>nohlsearch<cr>", opts, desc = "Turn off search highlight" },

		-- Remove <C-w>
		["<C-w>"] = { "<nop>", opts },
		["<localleader>w"] = { "<C-w>", opts, desc = "Window mode" },

		-- Split
		["<localleader>ws"] = { "<cmd>split<cr><C-w>j", opts, desc = "Split horizontal window" },
		["<localleader>wv"] = { "<cmd>vsplit<cr><C-w>l", opts, desc = "Split vertical window" },
		["<localleader>wS"] = { ":split ", desc = "Split horizontal window with current file" },
		["<localleader>wV"] = { ":vsplit ", desc = "Split vertical window with current file" },

		["<localleader>h"] = { "<C-w>h", opts, desc = "Move to left window" },
		["<localleader>j"] = { "<C-w>j", opts, desc = "Move to down window" },
		["<localleader>k"] = { "<C-w>k", opts, desc = "Move to up window" },
		["<localleader>l"] = { "<C-w>l", opts, desc = "Move to right window" },

		-- Tabs
		["<localleader>wt"] = { "<cmd>tabnew<cr>", opts, desc = "Create a new tab" },
		["<localleader>wT"] = { ":tabnew ", desc = "Create a new tab with current file" },
		["<localleader>wc"] = { "<cmd>wa<cr><cmd>tabclose<cr>", opts, desc = "Close current tabs" },
		["<localleader>wC"] = { "<cmd>tabclose<cr>", opts, desc = "Close current tabs (without saving)" },

		["]t"] = { "<cmd>tabnext<cr>", opts, desc = "Next tab" },
		["[t"] = { "<cmd>tabprevious<cr>", opts, desc = "Previous tab" },

		-- Buffers
		["]b"] = { "<cmd>bn<cr>", opts, desc = "Next buffer" },
		["[b"] = { "<cmd>bp<cr>", opts, desc = "Previous buffer" },
		["<localleader>q"] = { "<cmd>bdelete<cr>", opts, desc = "Close buffer" },

		-- Resizing
		["<C-left>"] = { "<cmd>vertical resize -2<cr>", opts },
		["<C-right>"] = { "<cmd>vertical resize +2<cr>", opts },
		["<C-up>"] = { "<cmd>resize +2<cr>", opts },
		["<C-down>"] = { "<cmd>resize -2<cr>", opts },
		["<localleader>wm"] = { "<C-w>|<C-w>_", opts, desc = "Maximize window" },
		["<localleader>w="] = { "<C-w>=", opts, desc = "Equalize window" },

		-- QFix
		["<localleader>co"] = { "<cmd>copen<cr>", opts, desc = "Open qfix" },
		["<localleader>cc"] = { "<cmd>cclose<cr>", opts, desc = "Close qfix" },
		["]c"] = { "<cmd>cnext<cr>", opts, desc = "Next qfix" },
		["[c"] = { "<cmd>cprevious<cr>", opts, desc = "Previous qfix" },

        -- Move strings
        ["<C-j>"] = { ":m +1<cr>", opts },
        ["<C-k>"] = { ":m -2<cr>", opts },
	},

	["i"] = {
		["jk"] = { "<Esc>" },

		-- Insert Enter
		["<C-j>"] = { "<cmd>norm o <cr>", opts },
		["<C-k>"] = { "<cmd>norm O <cr>", opts },
	},

	["ic"] = {
		["<C-h>"] = { "<C-Left>" },
		["<C-l>"] = { "<C-Right>" },
		["<A-h>"] = { "<left>" },
		["<A-l>"] = { "<right>" },
		["<A-k>"] = { "<up>" },
		["<A-j>"] = { "<down>" },
	},

	["v"] = {
        -- Move strings
		["<C-k>"] = { ":m '<-2<cr>gv=gv", opts },
		["<C-j>"] = { ":m '>+1<cr>gv=gv", opts },
		["K"] = { "k", { noremap = true } },
		["J"] = { "j", { noremap = true } },

		-- Normal
		["n"] = { ":norm " },

		-- Move tabs
        ["<"] = { "<gv" },
		[">"] = { ">gv" },

		-- Not yank
		["x"] = { '"_x' },
	},

	["vn"] = {
		-- Not yank
		["X"] = { '"_x' },
		["s"] = { '"_s' },
		["S"] = { '"_S' },

		["0"] = { "^", { noremap = true } },
		["^"] = { "0", { noremap = true } },
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
				["<localleader>fr"] = { "<cmd>w<cr><cmd>exec '!node' shellescape(@%, 1)<cr>", opts, desc = "Run node" },
			},
		})
	end,
})

autocmd("BufRead", {
	pattern = "*.py",
	callback = function()
		Bind({
			["n"] = {
				["<localleader>fr"] = {
					"<cmd>w<cr><cmd>exec '!python3.11' shellescape(@%, 1)<cr>",
					opts,
					desc = "Run python",
				},
			},
		})
	end,
})
