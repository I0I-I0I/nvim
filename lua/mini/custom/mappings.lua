Bind({
	["n"] = {
		["<leader>wt"] = { "<cmd>tabnew<cr><cmd>NvimTreeOpen<cr>", { silent = true } },
	},
})

-- Save
vim.cmd("cnoreabbrev save wa<cr><cmd>mksession! session.vim<cr><cmd>qa<cr>")
vim.cmd("cnoreabbrev ss source session.vim<cr>")
