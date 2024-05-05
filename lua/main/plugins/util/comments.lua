local Comment = {
	"numToStr/Comment.nvim",
	dependencies = {
		"JoosepAlviste/nvim-ts-context-commentstring",
	},
	event = "VeryLazy",
}

function Comment.config()
	local ts_context = require("ts_context_commentstring")
	local comment = require("Comment")

	vim.g.skip_ts_context_commentstring_module = true

	ts_context.setup()
	comment.setup({
		pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
	})
end

return Comment
