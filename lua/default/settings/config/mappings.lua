local opts = { noremap = true, silent = true }

vim.g.mapleader = ","
vim.g.maplocalleader = " "

local function bind_ai(keys, targets)
	local modes = { "i", "a" }
	for _, key in ipairs(keys) do
		for _, target in ipairs(targets) do
			local bind_i = key .. modes[1] .. "n" .. target
			local bind_a = key .. modes[2] .. "n" .. target
			Bind({
				["n"] = {
					[bind_i] = { "f" .. target .. key .. modes[1] .. target },
					[bind_a] = { "f" .. target .. key .. modes[2] .. target },
				}
			})
		end
	end
end

bind_ai(
	{ "c", "d", "y" },
	{ "(", ")", "{", "}", "[", "]", '"', "'", "`" }
)

Bind({
	["n"] = {
		-- Toggle paste mode
		["<localleader>tp"] = {
			function()
				vim.opt.paste = not vim.opt.paste._value
			end,
			desc = "Toggle paste mode",
		},

		-- Wrap
		["<localleader>tw"] = {
			function()
				vim.opt.wrap = not vim.opt.wrap._value
			end,
			opts,
			desc = "Toggle wrap",
		},

		-- Movement
		["<C-u>"] = { "<C-u>zz" },
		["<C-d>"] = { "<C-d>zz" },
		["n"] = { "nzzzv" },
		["N"] = { "Nzzzv" },
		["''"] = { "''zz" },
		["<C-y>"] = { "3<C-y>" },
		["<C-e>"] = { "3<C-e>" },

		-- Netrw
		["-"] = { "<cmd>Ex<cr>", opts, desc = "Toggle netrw" },

		-- Rename
		["R"] = { ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", desc = "Replace word" },
		["<localleader>r"] = { ":s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", desc = "Replace word on the line" },

		-- Turn off search highlight
		["<localleader><localleader>"] = { "<cmd>nohlsearch<cr>", opts, desc = "Turn off search highlight" },

		-- Tabs
		["<C-w>t"] = { "<cmd>tabnew<cr>", opts, desc = "Create a new tab" },
		["<C-w>c"] = { "<cmd>tabclose<cr>", opts, desc = "Close current tabs" },

		["]t"] = { "<cmd>tabnext<cr>", opts, desc = "Next tab" },
		["[t"] = { "<cmd>tabprevious<cr>", opts, desc = "Previous tab" },

		-- Buffers
		["]b"] = { "<cmd>bn<cr>", opts, desc = "Next buffer" },
		["[b"] = { "<cmd>bp<cr>", opts, desc = "Previous buffer" },

		-- Resizing
		["<C-w>m"] = { "<C-w>|<C-w>_", opts, desc = "Maximize window" },
		["<C-w>="] = { "<C-w>=", opts, desc = "Equalize window" },

		-- QFix
		["<localleader>co"] = { "<cmd>copen<cr>", opts, desc = "Open qfix" },
		["<localleader>cc"] = { "<cmd>cclose<cr>", opts, desc = "Close qfix" },
		["]c"] = { "<cmd>cnext<cr>", opts, desc = "Next qfix" },
		["[c"] = { "<cmd>cprevious<cr>", opts, desc = "Previous qfix" },

		-- Tmux
		["<C-f>"] = { "<cmd>silent !tmux neww tmux-sessionizer<cr>" },
		["<C-g>"] = { "<cmd>silent !tmux-lazygit<cr>" },
		["<localleader>st"] = { "<cmd>silent !tmux-start-job Development 1 npm run test<cr>" },
		["<localleader>sd"] = { "<cmd>silent !tmux-start-job Development 0 npm run dev<cr>" },
		["<localleader>sb"] = { "<cmd>silent !tmux-start-job Development 0 npm run build<cr>" },
		["<localleader>sr"] = { ":silent !tmux-start-job Development 0 " },

	},

	["ic"] = {
		["<A-h>"] = { "<left>" },
		["<A-l>"] = { "<right>" },
	},

	["v"] = {
		-- Move strings
		["K"] = { ":m '<-2<cr>gv=gv", opts },
		["J"] = { ":m '>+1<cr>gv=gv", opts },

		-- Move tabs
		["<"] = { "<gv" },
		[">"] = { ">gv" },
	},

	["vn"] = {
		-- Not yank
		["x"] = { '"_x' },
		["X"] = { '"_X' },
		["s"] = { '"_s' },
		["S"] = { '"_S' },
	},

	["x"] = {
		["P"] = { '"_dP' },
	},
})

-- Run
autocmd("BufRead", {
	pattern = "*.js",
	callback = function()
		Bind({
			["n"] = {
				["<localleader>r"] = { "<cmd>w<cr><cmd>exec '!node' shellescape(@%, 1)<cr>", opts, desc = "Run node" },
			},
		})
	end,
})

autocmd("BufRead", {
	pattern = "*.py",
	callback = function()
		Bind({
			["n"] = {
				["<localleader>r"] = {
					"<cmd>w<cr><cmd>exec '!python3.11' shellescape(@%, 1)<cr>",
					opts,
					desc = "Run python",
				},
			},
		})
	end,
})
