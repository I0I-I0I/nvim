local M = {
	dir = vim.g.local_plugins_path .. "sessions",
}

M.cmd = { "SessionAttach", "SessionsList", "SessionCreate" }

M.keys = {
	{
		"<leader>sl",
		function()
			require("sessions").open_list()
		end,
		{ silent = true },
		desc = "Open sessions list",
	},

	{
		"<leader>sc",
		function()
			require("sessions").create_session(true)
		end,
		{ silent = true },
		desc = "Create session",
	},

	{
		"<leader>sS",
		function()
			require("sessions").create_session()
		end,
		{ silent = true },
		desc = "Create session",
	},

	{
		"<leader>ss",
		function()
			require("sessions").attach_session()
		end,
		{ silent = true },
		desc = "Attach session",
	},
}

return M
