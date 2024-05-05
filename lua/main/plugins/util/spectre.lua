local Spectre = {
	"nvim-pack/nvim-spectre",
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = {
		{ "<leader>c" },
	},
}

function Spectre.config()
	vim.keymap.set("n", "<leader>cs", '<cmd>lua require("spectre").toggle()<CR>', {
		desc = "Toggle spectre",
	})
	vim.keymap.set("n", "<leader>cw", '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
		desc = "Search current word",
	})
	vim.keymap.set("v", "<leader>cw", '<esc><cmd>lua require("spectre").open_visual()<CR>', {
		desc = "Search current word",
	})
	vim.keymap.set("n", "<leader>cp", '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
		desc = "Search on current file",
	})
end

return Spectre
