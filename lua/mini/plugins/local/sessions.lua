local M = {
	dir = vim.g.local_plugins_path .. "sessions",
}

M.cmd = { "SessionAttach", "SessionsList", "SessionCreate" }

M.keys = function()
    local sessions = require("sessions")

	return {
		{
			"<leader>sl",
			function()
				sessions.open_list()
			end,
			{ silent = true },
			desc = "Open sessions list",
		},

		{
			"<leader>sc",
			function()
				sessions.create_session(true)
			end,
			{ silent = true },
			desc = "Create session",
		},

		{
			"<leader>sS",
			function()
				sessions.create_session()
			end,
			{ silent = true },
			desc = "Create session",
		},

		{
			"<leader>ss",
			function()
				sessions.attach_session()
			end,
			{ silent = true },
			desc = "Attach session",
		},
	}
end

return M
