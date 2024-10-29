local M = { dir = vim.g.local_plugins_path .. "zenmode" }

M.cmd = {
	"ZenmodeToggle",
	"ZenmodeCloseAll",
	"ZenmodeClose",
	"ZenmodeOpenAll",
	"ZenmodeOpen"
}

local opts = { silnet = true }

M.keys = {
	{ "zO", "<cmd>ZenmodeOpenAll<cr>", opts, desc = "Open zenmode for all tabs" },
	{ "zo", "<cmd>ZenmodeOpenAll 15<cr>", opts, desc = "Open zenmode for all tabs" },
	{ "zc", "<cmd>ZenmodeCloseAll<cr>", opts, desc = "Close zenmode for all tabs" },
}

return M
