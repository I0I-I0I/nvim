vim.opt.termguicolors = true

-- retrobox
-- habamax
-- onedark
-- kanagawa
-- OceanicNext
-- tokyonight
-- horizon
-- andromeda

function SetColor(color)
	if color == "andromeda" then
		require("andromeda").setup({
			preset = "andromeda",
			transparent_bg = true,
			styles = {
				italic = true,
			},
		})
	else
		color = color or "habamax"
		vim.cmd.colorscheme(color)
		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	end

	vim.api.nvim_set_hl(0, "ColorColumn", { bg = "none" })
	vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
end

SetColor("kanagawa-wave")
