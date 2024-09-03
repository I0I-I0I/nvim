local M = {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
}

function M.config()
	local lint = require("lint")

	lint.linters_by_ft = {
		javascript = { "eslint_d" },
		typescript = { "eslint_d" },
		javascriptreact = { "eslint_d" },
		typescriptreact = { "eslint_d" },
		python = { "pylint" },
		html = { "htmlhint" },
		-- css = { "stylelint" },
	}

	local lint_augroup = augroup("lint", { clear = true })

	autocmd({ "BufRead", "BufWritePost", "InsertLeave" }, {
		group = lint_augroup,
		callback = function()
			lint.try_lint()
		end,
	})
end

return M
