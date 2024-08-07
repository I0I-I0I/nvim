local M = {
	dir = vim.g.local_plugins_path .. "zenmode",
}

M.cmd = { "ZenmodeToggle", "ZenmodeCloseAll", "ZenmodeClose", "ZenmodeOpenAll", "ZenmodeOpen" }

local opts = { silnet = true }

M.keys = {
	{ "<leader>zo", "<cmd>ZenmodeOpen<cr>", opts, desc = "Open zenmode for current tab" },
	{ "<leader>zao", "<cmd>ZenmodeOpenAll<cr>", opts, desc = "Open zenmode for all tabs" },
	{ "<leader>zc", "<cmd>ZenmodeClose<cr>", opts, desc = "Close zenmode for current tab" },
	{ "<leader>zac", "<cmd>ZenmodeCloseAll<cr>", opts, desc = "Close zenmode for all tabs" },
	{ "<leader>zt", "<cmd>ZenmodeToggle<cr>", opts, desc = "Toggle zenmode" },
}

return M
