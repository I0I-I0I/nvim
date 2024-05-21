local lint = require("lint")

lint.linters_by_ft = {
	javascript = { "eslint_d" },
	typescript = { "eslint_d" },
	javascriptreact = { "eslint_d" },
	typescriptreact = { "eslint_d" },
	python = { "pylint" },
	css = { "stylelint" },
	html = { "htmlhint" },
}

local lint_augroup = augroup("lint", { clear = true })

autocmd({ "BufRead", "BufWritePost", "InsertLeave" }, {
	group = lint_augroup,
	callback = function()
		lint.try_lint()
	end,
})

vim.diagnostic.config({
	virtual_text = true,
	update_in_insert = true,
	sighns = true,
	underline = true,
	severity_sort = true,
	float = {
		focusable = false,
		border = false,
		header = "",
		prefix = "",
	},
})
