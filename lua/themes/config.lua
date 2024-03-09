local function string_to_array(string)
	local words = {}
	for w in string:gmatch("%w+") do
		table.insert(words, w)
	end
	return words
end

-- vim.api.nvim_set_hl(0, "StatusLine", { fg = "#235284" })

vim.g.everforest_diagnostic_line_highlight = 1

-- Disable italic
vim.cmd([[
    function! s:disable_italic()
      let his = ''
      redir => his
      silent hi
      redir END
      let his = substitute(his, '\n\s\+', ' ', 'g')
      for line in split(his, "\n")
        if line !~ ' links to ' && line !~ ' cleared$'
          exe 'hi' substitute(substitute(line, ' xxx ', ' ', ''), 'italic', 'none', 'g')
        endif
      endfor
    endfunction

    command! DisableItalic call s:disable_italic()
]])

vim.api.nvim_create_autocmd("VimEnter", {
	command = "DisableItalic",
})
function BackgroundTransparent(array)
	for _, el in ipairs(array) do
		vim.api.nvim_set_hl(0, el, { bg = "none" })
	end
end

function SetColor(color, transparent)
	vim.opt.background = "dark"
	vim.cmd("hi clear")
	vim.cmd.colorscheme(color)

	if transparent ~= 1 then
		if vim.g.neovide then
			local alpha = function()
				return string.format("%x", math.floor((255 * vim.g.transparency) or 0.8))
			end
			vim.g.neovide_transparency = transparent
			vim.g.transparency = 0.0
			vim.g.neovide_background_color = "#0f1117" .. alpha()
		end

		BackgroundTransparent({
			"Normal",
			"WinBar",
			"WinBarNC",
			"NormalNC",
			"NormalFloat",
			"ColorColumn",
			"LineNr",
			"TabLine",
			"TabLineFill",
			"TabLineSel",
			"SignColumn",
			"Folded",
			"FoldColumn",
			"FloatTitle",
			"FloatBorder",
			"StatusLine",
			"StatusLineNC",
			"WinSeparator",

			"BufferLineFill",
			"BufferLineBackground",
			"BufferLinePick",
			"BufferLineBufferSelected",
			"BufferLineSeparatorSelected",
			"BufferLineSeparator",

			"BufferLineDevIconDefault",
			"BufferLineIndicatorSelected",
			"BufferLineModified",
			"BufferLineModifiedSelected",
			"BufferLineError",
			"BufferLineErrorSelected",
			"BufferLineWarning",
			"BufferLineWarningSelected",

			"DiagnosticSignError",
			"DiagnosticSignOk",
			"DiagnosticSignHint",
			"DiagnosticSignWarn",
			"DiagnosticSignInfo",

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
		})

		vim.api.nvim_create_autocmd("BufEnter", {
			callback = function()
				BackgroundTransparent({
					"SignColumn",
					"Folded",

					"BufferLineFill",
					"BufferLineBackground",
					"BufferLinePick",
					"BufferLineBufferSelected",
					"BufferLineSeparatorSelected",
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

					"TelescopeBorder",
					"TelescopeNormal",
					"TelescopeSelectionCaret",

					"SagaBorder",
					"SagaTitle",
				})
			end,
		})

		vim.api.nvim_create_autocmd("CmdlineEnter", {
			callback = function()
				BackgroundTransparent({
					"NoiceCmdLinePopupBorder",
					"NoiceCmdLinePopupTitle",
					"NoiceCmdLineIcon",
					"NoiceCmdlineIconSearch",
					"NoiceCmdlinePopupBorderSearch",
					"NoiceCmdlineIconFilter",
				})
			end,
		})
	else
		if vim.g.neovide then
			vim.g.neovide_transparency = transparent
		end
	end

	vim.cmd("hi! CursorLine gui=underline cterm=underline guibg=NONE ctermfg=None guifg=None")

	vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = "#6d9571" })
	vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = "#ff0000" })
	vim.api.nvim_set_hl(0, "GitSignsChange", { fg = "#eed26e" })
	vim.api.nvim_set_hl(0, "GitSigns", { fg = "#ff0000" })

	vim.api.nvim_set_hl(0, "BufferLineModified", { fg = "#6d9571" })
	vim.api.nvim_set_hl(0, "BufferLineModifiedSelected", { fg = "#6d9571" })
	vim.api.nvim_set_hl(0, "BufferLineError", { fg = "#ff0000" })
	vim.api.nvim_set_hl(0, "BufferLineErrorSelected", { fg = "#ff0000" })
	vim.api.nvim_set_hl(0, "BufferLineWarning", { fg = "#eed26e" })
	vim.api.nvim_set_hl(0, "BufferLineWarningSelected", { fg = "#eed26e" })

	vim.api.nvim_set_hl(0, "Visual", { fg = "#1c1c1c", bg = "#e4e4e4" })

	vim.api.nvim_set_hl(0, "BufferLineDevIconLuaSelected", { fg = "#51a0cf" })
	vim.api.nvim_set_hl(0, "BufferLineDevIconLua", { fg = "#51a0cf" })
	vim.api.nvim_set_hl(0, "BufferLineDevIconJsSelected", { fg = "#cbcb41" })
	vim.api.nvim_set_hl(0, "BufferLineDevIconJs", { fg = "#cbcb41" })
	vim.api.nvim_set_hl(0, "BufferLineDevIconTestJsSelected", { fg = "#cbcb41" })
	vim.api.nvim_set_hl(0, "BufferLineDevIconTestJs", { fg = "#cbcb41" })
	vim.api.nvim_set_hl(0, "BufferLineDevIconDefault", { fg = "#4f5a5f" })
	vim.api.nvim_set_hl(0, "BufferLineDevIconDefaultSelected", { fg = "#4f5a5f" })
	vim.api.nvim_set_hl(0, "BufferLineDevIconGitIgnore", { fg = "#4f5a5f" })
	vim.api.nvim_set_hl(0, "BufferLineDevIconGitIgnoreSelected", { fg = "#4f5a5f" })
	vim.api.nvim_set_hl(0, "BufferLineDevIconTxt", { fg = "#89e051" })
	vim.api.nvim_set_hl(0, "BufferLineDevIconTxtSelected", { fg = "#89e051" })
	vim.api.nvim_set_hl(0, "BufferLineDevIconMd", { fg = "#ffffff" })
	vim.api.nvim_set_hl(0, "BufferLineDevIconMdSelected", { fg = "#ffffff" })
	vim.api.nvim_set_hl(0, "BufferLineDevIconCss", { fg = "#42a5f5" })
	vim.api.nvim_set_hl(0, "BufferLineDevIconCssSelected", { fg = "#42a5f5" })
	vim.api.nvim_set_hl(0, "BufferLineDevIconEditorConfig", { fg = "#ffffff" })
	vim.api.nvim_set_hl(0, "BufferLineDevIconEditorConfigSelected", { fg = "#ffffff" })
	vim.api.nvim_set_hl(0, "BufferLineDevIconCjs", { fg = "#cbcb41" })
	vim.api.nvim_set_hl(0, "BufferLineDevIconCjsSelected", { fg = "#cbcb41" })
	vim.api.nvim_set_hl(0, "BufferLineDevIconHtml", { fg = "#e44d26" })
	vim.api.nvim_set_hl(0, "BufferLineDevIconHtmlSelected", { fg = "#e44d26" })
	vim.api.nvim_set_hl(0, "BufferLineDevIconPackageJson", { fg = "#e8274b" })
	vim.api.nvim_set_hl(0, "BufferLineDevIconPackageJsonSelected", { fg = "#e8274b" })
	vim.api.nvim_set_hl(0, "BufferLineDevIconJson", { fg = "#cbcb41" })
	vim.api.nvim_set_hl(0, "BufferLineDevIconJsonSelected", { fg = "#cbcb41" })
	vim.api.nvim_set_hl(0, "BufferLineDevIconSvg", { fg = "#ffb13b" })
	vim.api.nvim_set_hl(0, "BufferLineDevIconSvgSelected", { fg = "#ffb13b" })

	vim.api.nvim_set_hl(0, "DiagnosticSignError", { fg = "#ff0000" })
	vim.api.nvim_set_hl(0, "DiagnosticSignOk", { fg = "#00ff00" })
	vim.api.nvim_set_hl(0, "DiagnosticSignHint", { fg = "#8a00c2" })
	vim.api.nvim_set_hl(0, "DiagnosticSignWarn", { fg = "#ffa500" })
	vim.api.nvim_set_hl(0, "DiagnosticSignInfo", { fg = "#235284" })

	vim.api.nvim_set_hl(0, "LineNr", { fg = "#747474" })
	vim.api.nvim_set_hl(0, "EndOfBuffer", { fg = "#000000" })
	vim.api.nvim_set_hl(0, "StatusLine", { fg = "#235284" })
	vim.api.nvim_set_hl(0, "StatusLineNC", { fg = "#235284" })

	vim.api.nvim_set_hl(0, "CybuFocus", { bg = "#e4e4e4", fg = "#1c1c1c" })
end

vim.api.nvim_create_user_command("Setcolor", function(input)
	local color = input.fargs[1]
	local transparent = tonumber(input.fargs[2])
	if not transparent then
		transparent = 0.7
	end
	SetColor(color, transparent)
	if input.fargs[3] ~= "italic" then
		vim.cmd("DisableItalic")
	end
end, {
	nargs = "*",
	complete = function(ArgLead, CmdLine, CursorPos)
		local colors = {
			"kanagawa",
			"substrata",
			"OceanicNext",
			"retrobox",
			"everforest",
		}

		local CmdLineArray = table.getn(string_to_array(CmdLine))
		if CmdLineArray == 1 then
			return colors
		elseif CmdLineArray == 3 then
			return { "italic" }
		end
	end,
})

SetColor("everforest", 0.7)
