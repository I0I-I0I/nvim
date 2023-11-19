vim.opt.termguicolors = true

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
	end

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	vim.api.nvim_set_hl(0, "ColorColumn", { bg = "none" })
	vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })

	vim.api.nvim_set_hl(0, "NoiceCmdLinePopupBorder", { bg = "none" })
	vim.api.nvim_set_hl(0, "NoiceCmdLinePopupTitle", { bg = "none" })
	vim.api.nvim_set_hl(0, "NoiceCmdLineIcon", { bg = "none" })

	vim.api.nvim_set_hl(0, "BufferLineFill", { bg = "none" })
	vim.api.nvim_set_hl(0, "BufferLineBackground", { bg = "none" })
	vim.api.nvim_set_hl(0, "BufferLinePick", { bg = "none" })
	vim.api.nvim_set_hl(0, "BufferLineBufferSelected", { bg = "none" })
	vim.api.nvim_set_hl(0, "BufferLineSeparatorSelected", { bg = "none" })
	vim.api.nvim_set_hl(0, "BufferLineSeparator", { bg = "none" })
	vim.api.nvim_set_hl(0, "BufferLineDevIconLua", { bg = "none" })
	vim.api.nvim_set_hl(0, "BufferLineDevIconLuaSelected", { bg = "none" })
	vim.api.nvim_set_hl(0, "BufferLineDevIconDefault", { bg = "none" })
	vim.api.nvim_set_hl(0, "WinSeparator", { bg = "none" })
end

vim.api.nvim_create_autocmd("BufEnter", {
	command = [[
	hi! NeoTreeFloatBorder ctermbg=NONE guibg=NONE 
	hi! NeoTreeFloatTitle ctermbg=NONE guibg=NONE 
	hi! NeoTreeFloatNormal ctermbg=NONE guibg=NONE 
	hi! NeoTreeNormal ctermbg=NONE guibg=NONE 
	hi! NeoTreeGitRenamed ctermbg=NONE guibg=NONE 
	hi! NeoTreeGitStage ctermbg=NONE guibg=NONE 
	hi! NeoTreeGitConflict ctermbg=NONE guibg=NONE 
	hi! NeoTreeGitUnstage ctermbg=NONE guibg=NONE 
	hi! NeoTreeGitUntracked ctermbg=NONE guibg=NONE 

	hi! TelescopeBorder ctermbg=NONE guibg=NONE 
	hi! TelescopeNormal ctermbg=NONE guibg=NONE 
	hi! TelescopeSelectionCaret ctermbg=NONE guibg=NONE 

	hi! SignColumn ctermbg=NONE guibg=NONE
	hi! GitSignsAdd ctermbg=NONE guibg=NONE
	hi! GitSignsRemove ctermbg=NONE guibg=NONE
	hi! GitSignsDelete ctermbg=NONE guibg=NONE
	hi! GitSignsChange ctermbg=NONE guibg=NONE
	]],
})

vim.api.nvim_create_autocmd("CmdlineEnter", {
	command = [[
	hi! NoiceCmdLinePopupBorder ctermbg=NONE guibg=NONE
	hi! NoiceCmdLinePopupTitle ctermbg=NONE guibg=NONE
	hi! NoiceCmdLineIcon ctermbg=NONE guibg=NONE
	]],
})

SetColor("horizon")

-- retrobox
-- habamax
-- onedark
-- kanagawa
-- OceanicNext
-- tokyonight
-- horizon
-- andromeda
