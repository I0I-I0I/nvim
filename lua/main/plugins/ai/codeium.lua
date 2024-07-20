local M = {
	"Exafunction/codeium.vim",
	event = "BufEnter",
}

function M.config()
	vim.keymap.set("i", "<C-c>", function()
		return vim.fn["codeium#Accept"]()
	end, { expr = true, silent = true })
	vim.keymap.set("i", "<A-]>", function()
		return vim.fn["codeium#CycleCompletions"](1)
	end, { expr = true, silent = true })
	vim.keymap.set("i", "<A-[>", function()
		return vim.fn["codeium#CycleCompletions"](-1)
	end, { expr = true, silent = true })
	vim.keymap.set("i", "<C-x>", function()
		return vim.fn["codeium#Clear"]()
	end, { expr = true, silent = true })

	vim.g.codeium_enable = true

	vim.g.codeium_manual = false
	vim.keymap.set("i", "<C-;>", "<Cmd>call codeium#CycleOrComplete()<CR>")
end

return M
