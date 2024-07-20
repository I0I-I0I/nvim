local M = {
	"stevearc/resession.nvim",
	cmd = { "Sessions" },
	keys = {
		"<leader>s",
	},
	dependencies = {
		{
			"tiagovla/scope.nvim",
			config = true,
		},
	},
	opts = {},
}

function M_telescope()
	local pickers = require("telescope.pickers")
	local finders = require("telescope.finders")
	local sorters = require("telescope.sorters")
	local actions = require("telescope.actions")
	local action_state = require("telescope.actions.state")
	local resession = require("resession")

	local all_sessions = function(opts)
		opts = require("telescope.themes").get_dropdown({})
		pickers
			.new(opts, {
				prompt_title = "🗃️ All sessions",
				finder = finders.new_table({
					results = resession.list(),
				}),
				sorter = sorters.get_generic_fuzzy_sorter(),

				attach_mappings = function(prompt_bufnr, _)
					actions.select_default:replace(function()
						actions.close(prompt_bufnr)
						local selection = action_state.get_selected_entry()
						require("resession").load(selection[1])
					end)
					actions.delete_buffer:replace(function()
						actions.close(prompt_bufnr)
						local selection = action_state.get_selected_entry()
						require("resession").delete(selection[1])
						vim.cmd("Sessions")
					end)
					return true
				end,
			})
			:find()
	end

	vim.api.nvim_create_user_command("Sessions", all_sessions, {})
end

function M.config()
	local resession = require("resession")

	resession.setup({
		buf_filter = function(bufnr)
			local buftype = vim.bo[bufnr].buftype
			if buftype == "help" then
				return true
			end
			if buftype ~= "" and buftype ~= "acwrite" then
				return false
			end
			if vim.api.nvim_buf_get_name(bufnr) == "" then
				return false
			end

			return true
		end,
		extensions = { scope = {} },
	})

	vim.keymap.set("n", "<leader>ss", function()
		if resession.get_current_session_info() == nil then
			local input = vim.fn.input("Name session -> ")
			if input ~= "" then
				resession.save(input)
			end
		else
			resession.save()
		end
	end)
	vim.keymap.set("n", "<leader>sl", "<cmd>Sessions<cr>")
	vim.keymap.set("n", "<leader>si", "<cmd>lua =require('resession').get_current_session_info()<cr>")
	vim.keymap.set("n", "<leader>sd", function()
		local current_session = resession.get_current()
		resession.detach()
		print('Disconnected from  session "' .. current_session .. '"')
	end)
	vim.keymap.set("n", "<leader>sD", function()
		local current_session = resession.get_current()
		resession.delete(current_session)
		print('M "' .. current_session .. '" is deleted')
	end)

	M_telescope()
end

return M
