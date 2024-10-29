local M = { dir = vim.g.local_plugins_path .. "sessions" }

M.cmd = { "SessionAttach", "SessionsList", "SessionCreate", "SessionSave" }

M.config = function()
	require("sessions").setup({
		path = "/mnt/d/sessions/",
		attach_after_enter = false,
	})
end

M.keys = function()
	local sessions = require("sessions")

	function ExitAndSave()
		local ok, _ = pcall(require, "zenmode")
		if ok then
			vim.cmd("ZenmodeCloseAll")
		end
		vim.cmd("SessionSave")
		vim.cmd("wqa")
	end

	vim.cmd.cnoreabbrev("sq lua ExitAndSave()")
	vim.cmd.cnoreabbrev("ss SessionSave")
	vim.cmd.cnoreabbrev("sl SessionsList")
	vim.cmd.cnoreabbrev("sc SessionCreate")

	return {
		{
			"<leader>s",
			function()
				sessions.attach_session()
			end,
			{ silent = true },
			desc = "Attach session",
		},
	}
end

return M
