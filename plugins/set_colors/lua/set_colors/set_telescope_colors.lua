local function set_telescope_colors(colorscheme)
	local telescope_colors
	if colorscheme == "rose-pine" then
		telescope_colors = {
			prompt_border = "#1f1f1f",
			border = "#262626",
			title_bg = "#e58d91",
			title_preview_bg = "#908caa",
		}
	elseif colorscheme == "solarized-osaka" then
		telescope_colors = {
			prompt_border = "#191f26",
			border = "#001419",
			title_bg = "#849900",
			title_preview_bg = "#268bd3",
		}
	elseif colorscheme == "everforest" then
		telescope_colors = {
			prompt_border = "#121212",
			border = "#2a2a2a",
			title_bg = "#82a882",
			title_preview_bg = "#b47575",
		}
	end

	if telescope_colors then
		vim.cmd.hi("TelescopeNormal" .. " guibg=" .. telescope_colors.border)
		vim.cmd.hi("TelescopeBorder guifg=" .. telescope_colors.border .. " guibg=" .. telescope_colors.border)
		vim.cmd.hi("TelescopeResultsTitle guifg=" .. telescope_colors.border)
		vim.cmd.hi("TelescopePromptTitle guibg=" .. telescope_colors.title_bg)
		vim.cmd.hi("TelescopePreviewTitle guibg=" .. telescope_colors.title_preview_bg)
		vim.cmd.hi(
			"TelescopePromptBorder guibg="
				.. telescope_colors.prompt_border
				.. " guifg="
				.. telescope_colors.prompt_border
		)
		vim.cmd.hi("TelescopePromptNormal guibg=" .. telescope_colors.prompt_border)
	end
	return telescope_colors
end

return set_telescope_colors
