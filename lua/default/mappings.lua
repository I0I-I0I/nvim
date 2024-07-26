local opts = { noremap = true, silent = true }

Bind({
	["n"] = {
		-- Toggle paste mode
		["<leader>p"] = {
			function()
				vim.opt.paste = not vim.opt.paste._value
			end,
		},

		-- Movement
			["<C-d>"] = { "<C-d>zz" },
			["<C-u>"] = { "<C-u>zz" },
			["n"] = { "nzzzv" },
			["N"] = { "Nzzzv" },

		-- Wrap
		["<leader>w"] = {
			function()
				vim.opt.wrap = not vim.opt.wrap._value
			end,
			opts,
		},

		-- Netrw
		["<leader>n"] = { "<cmd>Ex<cr>", opts },

		-- Rename
		["<leader>r"] = { ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>" },

		-- Turn off search highlight
		["<leader><leader>"] = { "<cmd>nohlsearch<cr>", opts },

		-- Split
		["<leader>ws"] = { "<cmd>split<cr><C-w>j", opts },
		["<leader>wv"] = { "<cmd>vsplit<cr><C-w>l", opts },
		["<leader>wS"] = { ":split " },
		["<leader>wV"] = { ":vsplit " },

		-- Tabs
		["<leader>wt"] = { "<cmd>tabnew<cr>", opts },
		["<leader>wT"] = { ":tabnew " },
		["<leader>wc"] = { "<cmd>wa<cr><cmd>tabclose<cr>", opts },
		["<leader>wC"] = { "<cmd>tabclose<cr>", opts },

		["]t"] = { "<cmd>tabnext<cr>", opts },
		["[t"] = { "<cmd>tabprevious<cr>", opts },

		-- Buffers
		["]b"] = { "<cmd>bn<cr>", opts },
		["[b"] = { "<cmd>bp<cr>", opts },
		["<leader>q"] = { "<cmd>bdelete<cr>", opts },

		-- Resizing
		["<C-left>"] = { "<cmd>vertical resize -2<cr>", opts },
		["<C-right>"] = { "<cmd>vertical resize +2<cr>", opts },
		["<C-up>"] = { "<cmd>resize +2<cr>", opts },
		["<C-down>"] = { "<cmd>resize -2<cr>", opts },
		["<leader>wm"] = { "<C-w>|<C-w>_", opts },
		["<leader>w="] = { "<C-w>=", opts },
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
				["<leader>fr"] = { "<cmd>w<cr><cmd>exec '!node' shellescape(@%, 1)<cr>", opts },
			},
		})
	end,
})

autocmd("BufRead", {
	pattern = "*.py",
	callback = function()
		Bind({
			["n"] = {
				["<leader>fr"] = { "<cmd>w<cr><cmd>exec '!python3.11' shellescape(@%, 1)<cr>", opts },
			},
		})
	end,
})
