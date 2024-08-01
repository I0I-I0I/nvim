local M = {
	"chrisgrieser/nvim-spider",
}

function M.config()
	Bind({
		["nox"] = {
			["w"] = { "<cmd>lua require('spider').motion('w')<CR>", desc = "w" },
			["e"] = { "<cmd>lua require('spider').motion('e')<CR>", desc = "e" },
			["b"] = { "<cmd>lua require('spider').motion('b')<CR>", desc = "b" },
		},
	})
	require("spider").setup()
end

return M
