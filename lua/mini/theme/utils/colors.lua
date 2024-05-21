local ErrorColor = "#ec5241"
local OkColor = "#a3ba5e"
local HintColor = "#99ff99"
local WarnColor = "#efb839"
local InfoColor = "#7ea9a7"

local colors = {
	default = {
		"Normal",
		"WinBar",
		"Normal",
		"WinBar",
		"WinBarNC",
		"NormalNC",
		"NormalFloat",
		"NormalSB",
		"ColorColumn",
		"LineNr",
		"TabLine",
		"TabLineFill",
		"TabLineSel",
		"SignColumn",
		"SignColumnSB",
		"Folded",
		"FoldColumn",
		"FloatTitle",
		"FloatBorder",
		"StatusLine",
		"StatusLineNC",
		"WinSeparator",
		"BufferLineFill",
		"BufferLinePick",
		"BufferLineBufferSelected",
		"BufferLineBufferVisible",
		"BufferLineDevIconDefault",
		"BufferLineIndicatorSelected",
		"BufferLineIndicatorVisible",
		"BufferLineModified",
		"BufferLineModifiedSelected",
		"BufferLineSeparator",
		"BufferLineSeparatorSelected",
		"BufferLineSeparatorVisible",
		"BufferLineTabSeparatorSelected",
		"BufferLineTabSeparator",
		"NeoTreeFloatBorder",
		"NeoTreeFloatTitle",
		"NeoTreeFloatNormal",
		"NeoTreeNormal",
		"NeoTreeNormalNC",
		"NeoTreeGitRenamed",
		"NeoTreeGitStage",
		"NeoTreeGitConflict",
		"NeoTreeGitUnstage",
		"NeoTreeGitUntracked",
		"NeoTreeEndOfBuffer",
		"TelescopeBorder",
		"TelescopePromptBorder",
		"TelescopePromptTitle",
		"TelescopeNormal",
		"TelescopeSelectionCaret",
		"GitSignsAdd",
		"GitSignsRemove",
		"GitSignsDelete",
		"GitSignsChange",
		"GitSignsAddPreview",
		"SagaBorder",
		"SagaTitle",
		"NoiceCmdLinePopupBorder",
		"NoiceCmdLinePopupTitle",
		"NoiceCmdLineIcon",
		"NoiceCmdlineIconSearch",
		"NoiceCmdlinePopupBorderSearch",
		"NoiceCmdlineIconFilter",
		"CybuBackground",
		"CybuBorder",
		"Pmenu",
		"TroubleNormal",
		"TroubleCount",
	},

	forBuf = {
		"SignColumn",
		"Folded",
		"BufferLineFill",
		"BufferLinePick",
		"BufferLineSeparatorSelected",
		"BufferLineSeparatorVisible",
		"BufferLineSeparator",
		"NeoTreeFloatBorder",
		"NeoTreeFloatTitle",
		"NeoTreeFloatNormal",
		"NeoTreeNormal",
		"NeoTreeGitRenamed",
		"NeoTreeGitStage",
		"NeoTreeGitConflict",
		"NeoTreeGitUnstage",
		"NeoTreeGitUntracked",
		"NeoTreeEndOfBuffer",
		"TelescopeBorder",
		"TelescopeNormal",
		"TelescopeSelectionCaret",
		"SagaBorder",
		"SagaTitle",
	},

	forCmd = {
		"NoiceCmdLinePopupBorder",
		"NoiceCmdLinePopupTitle",
		"NoiceCmdLineIcon",
		"NoiceCmdlineIconSearch",
		"NoiceCmdlinePopupBorderSearch",
		"NoiceCmdlineIconFilter",
	},

	withFgBg = {
		{ "GitSignsAdd", { fg = "#6d9571" } },
		{ "GitSignsDelete", { fg = "#ff0000" } },
		{ "GitSignsChange", { fg = "#eed26e" } },
		{ "GitSigns", { fg = "#ff0000" } },
		{ "Visual", { fg = "#1c1c1c", bg = "#e4e4e4" } },
		{ "BufferLineModified", { fg = "#6d9571" } },
		{ "BufferLineModifiedSelected", { fg = "#6d9571" } },
		{ "BufferLineError", { fg = "#ff0000" } },
		{ "BufferLineErrorSelected", { fg = "#ff0000" } },
		{ "BufferLineWarning", { fg = "#eed26e" } },
		{ "BufferLineWarningSelected", { fg = "#eed26e" } },
		{ "BufferLineDevIconLuaSelected", { fg = "#51a0cf" } },
		{ "BufferLineDevIconLuaInactive", { fg = "#51a0cf" } },
		{ "BufferLineDevIconLua", { fg = "#51a0cf" } },
		{ "BufferLineDevIconJsx", { fg = "#51a0cf" } },
		{ "BufferLineDevIconJsxSelected", { fg = "#51a0cf" } },
		{ "BufferLineDevIconJsxInactive", { fg = "#51a0cf" } },
		{ "BufferLineDevIconJsSelected", { fg = "#cbcb41" } },
		{ "BufferLineDevIconJsInactive", { fg = "#cbcb41" } },
		{ "BufferLineDevIconJs", { fg = "#cbcb41" } },
		{ "BufferLineDevIconTestJsSelected", { fg = "#cbcb41" } },
		{ "BufferLineDevIconTestJsInactive", { fg = "#cbcb41" } },
		{ "BufferLineDevIconTestJs", { fg = "#cbcb41" } },
		{ "BufferLineDevIconDefault", { fg = "#4f5a5f" } },
		{ "BufferLineDevIconDefaultSelected", { fg = "#4f5a5f" } },
		{ "BufferLineDevIconDefaultInactive", { fg = "#4f5a5f" } },
		{ "BufferLineDevIconGitIgnore", { fg = "#4f5a5f" } },
		{ "BufferLineDevIconGitIgnoreSelected", { fg = "#4f5a5f" } },
		{ "BufferLineDevIconGitIgnoreInactive", { fg = "#4f5a5f" } },
		{ "BufferLineDevIconTxt", { fg = "#89e051" } },
		{ "BufferLineDevIconTxtSelected", { fg = "#89e051" } },
		{ "BufferLineDevIconTxtInactive", { fg = "#89e051" } },
		{ "BufferLineDevIconMd", { fg = "#ffffff" } },
		{ "BufferLineDevIconMdSelected", { fg = "#ffffff" } },
		{ "BufferLineDevIconMdInactive", { fg = "#ffffff" } },
		{ "BufferLineDevIconCss", { fg = "#42a5f5" } },
		{ "BufferLineDevIconCssSelected", { fg = "#42a5f5" } },
		{ "BufferLineDevIconCssInactive", { fg = "#42a5f5" } },
		{ "BufferLineDevIconEditorConfig", { fg = "#ffffff" } },
		{ "BufferLineDevIconEditorConfigSelected", { fg = "#ffffff" } },
		{ "BufferLineDevIconEditorConfigInactive", { fg = "#ffffff" } },
		{ "BufferLineDevIconCjs", { fg = "#cbcb41" } },
		{ "BufferLineDevIconCjsSelected", { fg = "#cbcb41" } },
		{ "BufferLineDevIconCjsInactive", { fg = "#cbcb41" } },
		{ "BufferLineDevIconHtml", { fg = "#e44d26" } },
		{ "BufferLineDevIconHtmlSelected", { fg = "#e44d26" } },
		{ "BufferLineDevIconHtmlInactive", { fg = "#e44d26" } },
		{ "BufferLineDevIconPackageJson", { fg = "#e8274b" } },
		{ "BufferLineDevIconPackageJsonSelected", { fg = "#e8274b" } },
		{ "BufferLineDevIconPackageJsonInactive", { fg = "#e8274b" } },
		{ "BufferLineDevIconJson", { fg = "#cbcb41" } },
		{ "BufferLineDevIconJsonSelected", { fg = "#cbcb41" } },
		{ "BufferLineDevIconJsonInactive", { fg = "#cbcb41" } },
		{ "BufferLineDevIconSvg", { fg = "#ffb13b" } },
		{ "BufferLineDevIconSvgSelected", { fg = "#ffb13b" } },
		{ "BufferLineDevIconSvgInactive", { fg = "#ffb13b" } },
		{ "BufferLineInfo", { fg = InfoColor } },
		{ "BufferLineInfoVisible", { fg = InfoColor } },
		{ "BufferLineInfoSelected", { fg = InfoColor } },
		{ "BufferLineInfoDiagnostic", { fg = InfoColor } },
		{ "BufferLineInfoDiagnosticVisible", { fg = InfoColor } },
		{ "BufferLineInfoDiagnosticSelected", { fg = InfoColor } },
		{ "BufferLineError", { fg = ErrorColor } },
		{ "BufferLineErrorVisible", { fg = ErrorColor } },
		{ "BufferLineErrorSelected", { fg = ErrorColor } },
		{ "BufferLineErrorDiagnostic", { fg = ErrorColor } },
		{ "BufferLineErrorDiagnosticVisible", { fg = ErrorColor } },
		{ "BufferLineErrorDiagnosticSelected", { fg = ErrorColor } },
		{ "BufferLineWarning", { fg = WarnColor } },
		{ "BufferLineWarningVisible", { fg = WarnColor } },
		{ "BufferLineWarningSelected", { fg = WarnColor } },
		{ "BufferLineWarningDiagnostic", { fg = WarnColor } },
		{ "BufferLineWarningDiagnosticVisible", { fg = WarnColor } },
		{ "BufferLineWarningDiagnosticSelected", { fg = WarnColor } },
		{ "BufferLineHint", { fg = HintColor } },
		{ "BufferLineHintVisible", { fg = HintColor } },
		{ "BufferLineHintSelected", { fg = HintColor } },
		{ "BufferLineHintDiagnostic", { fg = HintColor } },
		{ "BufferLineHintDiagnosticVisible", { fg = HintColor } },
		{ "BufferLineHintDiagnosticSelected", { fg = HintColor } },
		{ "BufferLineTruncMarker", { fg = "#aaaaaa" } },
		{ "BufferLineBackground", { fg = "#444444" } },
		{ "BufferLineBufferSelected", { fg = "#ffffff" } },
		{ "BufferLineOffsetSeparator", { fg = "#555555" } },
		{ "BufferLineTab", { fg = "#444444" } },
		{ "BufferLineTabSelected", { fg = "#ffffff" } },
		{ "BufferLineNumbers", { fg = "#666666" } },
		{ "BufferLineNumbersVisible", { fg = "#666666" } },
		{ "BufferLineNumbersSelected", { fg = "#ffffff" } },
		{ "DiagnosticSignError", { fg = ErrorColor } },
		{ "DiagnosticSignOk", { fg = OkColor } },
		{ "DiagnosticSignHint", { fg = HintColor } },
		{ "DiagnosticSignWarn", { fg = WarnColor } },
		{ "DiagnosticSignInfo", { fg = InfoColor } },
		{ "DiagnosticVirtualTextError", { fg = ErrorColor } },
		{ "DiagnosticVirtualTextOk", { fg = OkColor } },
		{ "DiagnosticVirtualTextHint", { fg = HintColor } },
		{ "DiagnosticVirtualTextWarn", { fg = WarnColor } },
		{ "DiagnosticVirtualTextInfo", { fg = InfoColor } },
		{ "LineNr", { fg = "#747474" } },
		{ "StatusLine", { fg = "#235284" } },
		{ "StatusLineNC", { fg = "#235284" } },
		{ "NotifyERRORBorder", { fg = ErrorColor } },
		{ "NotifyERRORIcon", { fg = ErrorColor } },
		{ "NotifyERRORTitle", { fg = ErrorColor } },
		{ "NotifyERRORBody", { fg = ErrorColor } },
		{ "NotifyWARNBorder", { fg = WarnColor } },
		{ "NotifyWARNIcon", { fg = WarnColor } },
		{ "NotifyWARNTitle", { fg = WarnColor } },
		{ "NotifyWARNBody", { fg = WarnColor } },
		{ "NotifyINFOBorder", { fg = OkColor } },
		{ "NotifyINFOIcon", { fg = OkColor } },
		{ "NotifyINFOTitle", { fg = OkColor } },
		{ "NotifyINFOBody", { fg = OkColor } },
		{ "NotifyTRACEBorder", { fg = OkColor } },
		{ "NotifyTRACEIcon", { fg = OkColor } },
		{ "NotifyTRACETitle", { fg = OkColor } },
		{ "NotifyTRACEBody", { fg = OkColor } },
		{ "NotifyDEBUGBorder", { fg = HintColor } },
		{ "NotifyDEBUGIcon", { fg = HintColor } },
		{ "NotifyDEBUGTitle", { fg = HintColor } },
		{ "NotifyDEBUGBody", { fg = HintColor } },
		{ "LineNr", { fg = "#ffffff" } },
		{ "LineNrBelow", { fg = "#747474" } },
		{ "LineNrAbove", { fg = "#747474" } },
		{ "EndOfBuffer", { fg = "#111111" } },
		{ "WinSeparator", { fg = "#555555" } },
		{ "NeoTreeWinSeparator", { fg = "#555555" } },
		{ "NeoTreeTabInactive", { fg = "#666666" } },

		{ "NeoTreeTabSeparatorActive", { fg = "#555555" } },
		{ "NeoTreeTabSeparatorInactive", { fg = "#555555" } },
		{ "TelescopeSelection", { fg = "#fff000" } },
		{ "TelescopeResultNormal", { fg = "#ffffff" } },
		{ "TelescopeResultTitle", { fg = "#ffffff" } },
		{ "TelescopeResultBorder", { fg = "#ffffff" } },
		{ "TelescopePromptNormal", { fg = "#ffffff" } },
		{ "NeoTreeCursorLine", { fg = "#fff000" } },
		{ "CybuFocus", { bg = "#e4e4e4", fg = "#1c1c1c" } },
	},
}

return colors
