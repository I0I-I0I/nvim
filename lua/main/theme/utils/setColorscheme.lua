function SetColorscheme(color, transparent)
	if not transparent then
		transparent = 0.6
	end
	local function setColor(item, color)
		if color == nil then
			color = { bg = "none" }
		end
		vim.api.nvim_set_hl(0, item, color)
	end

	local colors = require(Theme_utils .. "colors")

	vim.opt.background = "dark"
	vim.cmd("hi clear")
	vim.cmd.colorscheme(color)

	if transparent ~= 1 then
		if vim.g.neovide then
			vim.g.neovide_transparency = transparent
		end

		for _, item in ipairs(colors.default) do
			setColor(item)
		end

		autocmd("BufEnter", {
			callback = function()
				for _, item in ipairs(colors.forBuf) do
					setColor(item)
				end
			end,
		})

		autocmd("CmdlineEnter", {
			callback = function()
				for _, item in ipairs(colors.forCmd) do
					setColor(item)
				end
			end,
		})
	else
		if vim.g.neovide then
			vim.g.neovide_transparency = 1
		end
	end

	ErrorColor = "#ff0000"
	OkColor = "#89e051"
	HintColor = "#8a00c2"
	WarnColor = "#ffa500"
	InfoColor = "#235284"

	vim.cmd("hi! CursorLine gui=underline cterm=underline guibg=NONE ctermfg=None guifg=None")

	setColor("GitSignsAdd", { fg = "#6d9571" })
	setColor("GitSignsDelete", { fg = "#ff0000" })
	setColor("GitSignsChange", { fg = "#eed26e" })
	setColor("GitSigns", { fg = "#ff0000" })
	setColor("Visual", { fg = "#1c1c1c", bg = "#e4e4e4" })

	setColor("BufferLineModified", { fg = "#6d9571" })
	setColor("BufferLineModifiedSelected", { fg = "#6d9571" })
	setColor("BufferLineError", { fg = "#ff0000" })
	setColor("BufferLineErrorSelected", { fg = "#ff0000" })
	setColor("BufferLineWarning", { fg = "#eed26e" })
	setColor("BufferLineWarningSelected", { fg = "#eed26e" })
	setColor("BufferLineDevIconLuaSelected", { fg = "#51a0cf" })
	setColor("BufferLineDevIconLuaInactive", { fg = "#51a0cf" })
	setColor("BufferLineDevIconLua", { fg = "#51a0cf" })
	setColor("BufferLineDevIconJsSelected", { fg = "#cbcb41" })
	setColor("BufferLineDevIconJsInactive", { fg = "#cbcb41" })
	setColor("BufferLineDevIconJs", { fg = "#cbcb41" })
	setColor("BufferLineDevIconTestJsSelected", { fg = "#cbcb41" })
	setColor("BufferLineDevIconTestJsInactive", { fg = "#cbcb41" })
	setColor("BufferLineDevIconTestJs", { fg = "#cbcb41" })
	setColor("BufferLineDevIconDefault", { fg = "#4f5a5f" })
	setColor("BufferLineDevIconDefaultSelected", { fg = "#4f5a5f" })
	setColor("BufferLineDevIconDefaultInactive", { fg = "#4f5a5f" })
	setColor("BufferLineDevIconGitIgnore", { fg = "#4f5a5f" })
	setColor("BufferLineDevIconGitIgnoreSelected", { fg = "#4f5a5f" })
	setColor("BufferLineDevIconGitIgnoreInactive", { fg = "#4f5a5f" })
	setColor("BufferLineDevIconTxt", { fg = "#89e051" })
	setColor("BufferLineDevIconTxtSelected", { fg = "#89e051" })
	setColor("BufferLineDevIconTxtInactive", { fg = "#89e051" })
	setColor("BufferLineDevIconMd", { fg = "#ffffff" })
	setColor("BufferLineDevIconMdSelected", { fg = "#ffffff" })
	setColor("BufferLineDevIconMdInactive", { fg = "#ffffff" })
	setColor("BufferLineDevIconCss", { fg = "#42a5f5" })
	setColor("BufferLineDevIconCssSelected", { fg = "#42a5f5" })
	setColor("BufferLineDevIconCssInactive", { fg = "#42a5f5" })
	setColor("BufferLineDevIconEditorConfig", { fg = "#ffffff" })
	setColor("BufferLineDevIconEditorConfigSelected", { fg = "#ffffff" })
	setColor("BufferLineDevIconEditorConfigInactive", { fg = "#ffffff" })
	setColor("BufferLineDevIconCjs", { fg = "#cbcb41" })
	setColor("BufferLineDevIconCjsSelected", { fg = "#cbcb41" })
	setColor("BufferLineDevIconCjsInactive", { fg = "#cbcb41" })
	setColor("BufferLineDevIconHtml", { fg = "#e44d26" })
	setColor("BufferLineDevIconHtmlSelected", { fg = "#e44d26" })
	setColor("BufferLineDevIconHtmlInactive", { fg = "#e44d26" })
	setColor("BufferLineDevIconPackageJson", { fg = "#e8274b" })
	setColor("BufferLineDevIconPackageJsonSelected", { fg = "#e8274b" })
	setColor("BufferLineDevIconPackageJsonInactive", { fg = "#e8274b" })
	setColor("BufferLineDevIconJson", { fg = "#cbcb41" })
	setColor("BufferLineDevIconJsonSelected", { fg = "#cbcb41" })
	setColor("BufferLineDevIconJsonInactive", { fg = "#cbcb41" })
	setColor("BufferLineDevIconSvg", { fg = "#ffb13b" })
	setColor("BufferLineDevIconSvgSelected", { fg = "#ffb13b" })
	setColor("BufferLineDevIconSvgInactive", { fg = "#ffb13b" })

	setColor("BufferLineInfo", { fg = InfoColor })
	setColor("BufferLineInfoVisible", { fg = InfoColor })
	setColor("BufferLineInfoSelected", { fg = InfoColor })
	setColor("BufferLineInfoDiagnostic", { fg = InfoColor })
	setColor("BufferLineInfoDiagnosticVisible", { fg = InfoColor })
	setColor("BufferLineInfoDiagnosticSelected", { fg = InfoColor })

	setColor("BufferLineError", { fg = ErrorColor })
	setColor("BufferLineErrorVisible", { fg = ErrorColor })
	setColor("BufferLineErrorSelected", { fg = ErrorColor })
	setColor("BufferLineErrorDiagnostic", { fg = ErrorColor })
	setColor("BufferLineErrorDiagnosticVisible", { fg = ErrorColor })
	setColor("BufferLineErrorDiagnosticSelected", { fg = ErrorColor })

	setColor("BufferLineWarning", { fg = WarnColor })
	setColor("BufferLineWarningVisible", { fg = WarnColor })
	setColor("BufferLineWarningSelected", { fg = WarnColor })
	setColor("BufferLineWarningDiagnostic", { fg = WarnColor })
	setColor("BufferLineWarningDiagnosticVisible", { fg = WarnColor })
	setColor("BufferLineWarningDiagnosticSelected", { fg = WarnColor })

	setColor("BufferLineHint", { fg = HintColor })
	setColor("BufferLineHintVisible", { fg = HintColor })
	setColor("BufferLineHintSelected", { fg = HintColor })
	setColor("BufferLineHintDiagnostic", { fg = HintColor })
	setColor("BufferLineHintDiagnosticVisible", { fg = HintColor })
	setColor("BufferLineHintDiagnosticSelected", { fg = HintColor })

	setColor("BufferLineTruncMarker", { fg = "#aaaaaa" })

	setColor("BufferLineBackground", { fg = "#444444" })
	setColor("BufferLineBufferSelected", { fg = "#ffffff" })
	setColor("BufferLineOffsetSeparator", { fg = "#555555" })

	setColor("BufferLineTab", { fg = "#444444" })
	setColor("BufferLineTabSelected", { fg = "#ffffff" })

	setColor("BufferLineNumbers", { fg = "#666666" })
	setColor("BufferLineNumbersVisible", { fg = "#666666" })
	setColor("BufferLineNumbersSelected", { fg = "#ffffff" })

	setColor("DiagnosticSignError", { fg = ErrorColor })
	setColor("DiagnosticSignOk", { fg = OkColor })
	setColor("DiagnosticSignHint", { fg = HintColor })
	setColor("DiagnosticSignWarn", { fg = WarnColor })
	setColor("DiagnosticSignInfo", { fg = InfoColor })
	setColor("DiagnosticVirtualTextError", { fg = ErrorColor })
	setColor("DiagnosticVirtualTextOk", { fg = OkColor })
	setColor("DiagnosticVirtualTextHint", { fg = HintColor })
	setColor("DiagnosticVirtualTextWarn", { fg = WarnColor })
	setColor("DiagnosticVirtualTextInfo", { fg = InfoColor })
	setColor("LineNr", { fg = "#747474" })
	setColor("StatusLine", { fg = "#235284" })
	setColor("StatusLineNC", { fg = "#235284" })
	setColor("NotifyERRORBorder", { fg = ErrorColor })
	setColor("NotifyERRORIcon", { fg = ErrorColor })
	setColor("NotifyERRORTitle", { fg = ErrorColor })
	setColor("NotifyERRORBody", { fg = ErrorColor })
	setColor("NotifyWARNBorder", { fg = WarnColor })
	setColor("NotifyWARNIcon", { fg = WarnColor })
	setColor("NotifyWARNTitle", { fg = WarnColor })
	setColor("NotifyWARNBody", { fg = WarnColor })
	setColor("NotifyINFOBorder", { fg = OkColor })
	setColor("NotifyINFOIcon", { fg = OkColor })
	setColor("NotifyINFOTitle", { fg = OkColor })
	setColor("NotifyINFOBody", { fg = OkColor })
	setColor("NotifyTRACEBorder", { fg = OkColor })
	setColor("NotifyTRACEIcon", { fg = OkColor })
	setColor("NotifyTRACETitle", { fg = OkColor })
	setColor("NotifyTRACEBody", { fg = OkColor })
	setColor("NotifyDEBUGBorder", { fg = HintColor })
	setColor("NotifyDEBUGIcon", { fg = HintColor })
	setColor("NotifyDEBUGTitle", { fg = HintColor })
	setColor("NotifyDEBUGBody", { fg = HintColor })

	setColor("LineNr", { fg = "#ffffff" })
	setColor("LineNrBelow", { fg = "#747474" })
	setColor("LineNrAbove", { fg = "#747474" })

	setColor("EndOfBuffer", { fg = "#111111" })
	setColor("WinSeparator", { fg = "#555555" })

	setColor("TelescopeSelection", { fg = "#fff000" })
	setColor("NeoTreeCursorLine", { fg = "#fff000" })

	setColor("CybuFocus", { bg = "#e4e4e4", fg = "#1c1c1c" })

	vim.cmd("hi IlluminatedWord gui=underline guibg=none")
	vim.cmd("hi IlluminatedWordRead gui=underline guibg=none")
	vim.cmd("hi IlluminatedWordWrite gui=underline guibg=none")
	vim.cmd("hi IlluminatedWordText gui=underline guibg=none")
end
