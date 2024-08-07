local LuaColor = "#51a0cf"
local JsColor = "#cbcb41"
local CjsColor = "#cbcb41"
local JsxColor = "#51a0cf"
local DefaultColor = "#4f5a5f"
local TestJsColor = "#cbcb41"
local GitIgnoreColor = "#4f5a5f"
local TxtColor = "#89e051"
local MdColor = "#ffffff"
local CssColor = "#42a5f5"
local EditorConfigColor = "#ffffff"
local HtmlColor = "#e44d26"
local PackageJsonColor = "#e8274b"
local JsonColor = "#cbcb41"
local SvgColor = "#ffb13b"
local PyColor = "#ffbc03"
local PycColor = "#ffe291"
local ScssColor = "#f55385"
local TsxColor = "#1354bf"
local TsColor = "#519aba"
local TsConfigColor = "#519aba"
local TsDColor = "#d59855"

local function update_toggle_colors()
	local inactiveColor
	if not COLOR then
		inactiveColor = "#d3d7cf"
	end

	return {
		{ "BufferLineDevIconLuaSelected", { fg = inactiveColor or LuaColor } },
		{ "BufferLineDevIconJsxSelected", { fg = inactiveColor or JsxColor } },
		{ "BufferLineDevIconJsSelected", { fg = inactiveColor or JsColor } },
		{ "BufferLineDevIconTestJsSelected", { fg = inactiveColor or TestJsColor } },
		{ "BufferLineDevIconDefaultSelected", { fg = inactiveColor or DefaultColor } },
		{ "BufferLineDevIconGitIgnoreSelected", { fg = inactiveColor or GitIgnoreColor } },
		{ "BufferLineDevIconTxtSelected", { fg = inactiveColor or TxtColor } },
		{ "BufferLineDevIconMdSelected", { fg = inactiveColor or MdColor } },
		{ "BufferLineDevIconCssSelected", { fg = inactiveColor or CssColor } },
		{ "BufferLineDevIconEditorConfigSelected", { fg = inactiveColor or EditorConfigColor } },
		{ "BufferLineDevIconCjsSelected", { fg = inactiveColor or CjsColor } },
		{ "BufferLineDevIconHtmlSelected", { fg = inactiveColor or HtmlColor } },
		{ "BufferLineDevIconPackageJsonSelected", { fg = inactiveColor or PackageJsonColor } },
		{ "BufferLineDevIconPackageLockJsonSelected", { fg = inactiveColor or PackageJsonColor } },
		{ "BufferLineDevIconJsonSelected", { fg = inactiveColor or JsonColor } },
		{ "BufferLineDevIconSvgSelected", { fg = inactiveColor or SvgColor } },
		{ "BufferLineDevIconTsxSelected", { fg = inactiveColor or TsxColor } },
		{ "BufferLineDevIconTypeScriptSelected", { fg = inactiveColor or TsColor } },
		{ "BufferLineDevIconTSConfigSelected", { fg = inactiveColor or TsConfigColor } },
		{ "BufferLineDevIconTypeScriptDeclarationSelected", { fg = inactiveColor or TsDColor } },

		{ "DevIconDefault", { fg = inactiveColor or DefaultColor } },
		{ "DevIconJs", { fg = inactiveColor or JsColor } },
		{ "DevIconJsx", { fg = inactiveColor or JsxColor } },
		{ "DevIconTestJs", { fg = inactiveColor or TestJsColor } },
		{ "DevIconCjs", { fg = inactiveColor or CjsColor } },
		{ "DevIconPackageJson", { fg = inactiveColor or PackageJsonColor } },
		{ "DevIconPackageLockJson", { fg = inactiveColor or PackageJsonColor } },
		{ "DevIconJson", { fg = inactiveColor or JsonColor } },
		{ "DevIconLua", { fg = inactiveColor or LuaColor } },
		{ "DevIconMd", { fg = inactiveColor or MdColor } },
		{ "DevIconHtml", { fg = inactiveColor or HtmlColor } },
		{ "DevIconCss", { fg = inactiveColor or CssColor } },
		{ "DevIconSvg", { fg = inactiveColor or SvgColor } },
		{ "DevIconGitIgnore", { fg = inactiveColor or GitIgnoreColor } },
		{ "DevIconEditorConfig", { fg = inactiveColor or EditorConfigColor } },
		{ "DevIconTxt", { fg = inactiveColor or TxtColor } },

		{ "DevIconTsxSelected", { fg = inactiveColor or TsxColor } },
		{ "DevIconTypeScriptSelected", { fg = inactiveColor or TsColor } },
		{ "DevIconTSConfigSelected", { fg = inactiveColor or TsConfigColor } },
		{ "DevIconTypeScriptDeclarationSelected", { fg = inactiveColor or TsDColor } },

		{ "DevIconPy", { fg = inactiveColor or PyColor } },
		{ "DevIconPyc", { fg = inactiveColor or PycColor } },
		{ "DevIconScss", { fg = inactiveColor or ScssColor } },
	}
end

return update_toggle_colors
