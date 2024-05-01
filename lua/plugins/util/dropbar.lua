local DropBar = {
	"Bekaboo/dropbar.nvim",
	dependencies = {
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
		},
	},
	event = { "BufRead", "BufNewFile" },
}

function DropBar.config()
	vim.keymap.set("n", "<leader>b", "<cmd>lua require('dropbar.api').pick()<cr>")
	vim.ui.select = require("dropbar.utils.menu").select
end

return DropBar
