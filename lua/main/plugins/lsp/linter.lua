local Lint = {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
}

function Lint.config()
	local lint = require("lint")

	lint.linters_by_ft = {
		javascript = { "eslint_d" },
		typescript = { "eslint_d" },
		javascriptreact = { "eslint_d" },
		typescriptreact = { "eslint_d" },
		python = { "pylint" },
		css = { "stylelint" },
	}

	local lint_augroup = augroup("lint", { clear = true })

	autocmd({ "BufRead", "BufWritePost", "InsertLeave" }, {
		group = lint_augroup,
		callback = function()
			lint.try_lint()
		end,
	})
end

return Lint
