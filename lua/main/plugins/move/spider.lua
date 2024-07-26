local M = {
	"chrisgrieser/nvim-spider",
}

function M.config()
	Bind({
		["nox"] = {
			["w"] = { "<cmd>lua require('spider').motion('w')<CR>", { desc = "Spider-w" } },
			["e"] = { "<cmd>lua require('spider').motion('e')<CR>", { desc = "Spider-e" } },
			["b"] = { "<cmd>lua require('spider').motion('b')<CR>", { desc = "Spider-b" } },
		},
	})
	require("spider").setup()
end

return M
