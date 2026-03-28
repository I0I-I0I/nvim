---@alias ThreeColorsGroup string

---@class ThreeColorsHighlightOpts: vim.api.keyset.highlight

---@class ThreeColorsPalette
---@field bg string
---@field fg string
---@field comment string
---@field keyword string
---@field type string
---@field string string
---@field cursorline string
---@field git_add string
---@field git_delete string
---@field git_change string
---@field git_add_bg string
---@field git_delete_bg string
---@field git_change_bg string
---@field git_text_bg string

---@class ThreeColorsVariant
---@field name string
---@field background? string
---@field palette ThreeColorsPalette
---@field comment_italic? boolean

---@class ThreeColorsGroupSpec
---@field style fun(variant: ThreeColorsVariant): ThreeColorsHighlightOpts
---@field groups ThreeColorsGroup[]

local M = {}

---@type fun(ns_id: integer, name: string, val: vim.api.keyset.highlight)
local set = vim.api.nvim_set_hl

---@param variant ThreeColorsVariant
---@return string
local function normal_bg(variant)
    return variant.palette.bg
end

---@param variant ThreeColorsVariant
---@return string
local function menu_bg(variant)
    if variant.palette.bg == "NONE" then
        return variant.palette.cursorline
    end

    return variant.palette.bg
end

---@param variant ThreeColorsVariant
---@return string
local function cursor_fg(variant)
    if variant.palette.bg == "NONE" then
        return variant.palette.cursorline
    end

    return variant.palette.bg
end

---@type ThreeColorsGroupSpec[]
local highlight_groups = {
    {
        style = function(variant)
            return { fg = variant.palette.fg, bg = variant.palette.bg }
        end,
        groups = {
            "Normal",
        },
    },
    {
        style = function(variant)
            return { bg = variant.palette.git_add_bg }
        end,
        groups = {
            "DiffAdd",
        },
    },
    {
        style = function(variant)
            return { bg = variant.palette.git_delete_bg }
        end,
        groups = {
            "DiffDelete",
        },
    },
    {
        style = function(variant)
            return { bg = variant.palette.git_change_bg }
        end,
        groups = {
            "DiffChange",
        },
    },
    {
        style = function(variant)
            return { bg = variant.palette.git_text_bg, bold = true }
        end,
        groups = {
            "DiffText",
        },
    },
    {
        style = function(variant)
            return { fg = variant.palette.git_add, bg = normal_bg(variant), bold = true }
        end,
        groups = {
            "Added",
            "DiffAdded",
            "diffAdded",
            "@diff.plus",
        },
    },
    {
        style = function(variant)
            return { fg = variant.palette.git_delete, bg = normal_bg(variant), bold = true }
        end,
        groups = {
            "Removed",
            "DiffRemoved",
            "diffRemoved",
            "@diff.minus",
        },
    },
    {
        style = function(variant)
            return { fg = variant.palette.git_change, bg = normal_bg(variant), bold = true }
        end,
        groups = {
            "Changed",
            "DiffChanged",
            "diffChanged",
            "@diff.delta",
            "DiffFile",
            "DiffNewFile",
            "DiffLine",
            "DiffIndexLine",
        },
    },
    {
        style = function(variant)
            return { fg = cursor_fg(variant), bg = variant.palette.fg, nocombine = true }
        end,
        groups = {
            "Cursor",
            "lCursor",
            "CursorIM",
            "TermCursor",
            "TermCursorNC",
        },
    },
    {
        style = function(variant)
            return { fg = variant.palette.comment, bg = normal_bg(variant) }
        end,
        groups = {
            "LineNr",
            "LineNrAbove",
            "LineNrBelow",
            "SignColumn",
            "Folded",
            "FoldColumn",
            "MarkSignNumHL",
            "MarkVirtTextHL",
        },
    },
    {
        style = function(variant)
            return { fg = variant.palette.keyword, bg = normal_bg(variant), bold = true }
        end,
        groups = {
            "MarkSignHL",
        },
    },
    {
        style = function(variant)
            return { bg = variant.palette.cursorline }
        end,
        groups = {
            "CursorLine",
            "CursorColumn",
            "CursorLineFold",
            "CursorLineSign",
        },
    },
    {
        style = function(variant)
            return { fg = variant.palette.keyword, bg = variant.palette.cursorline, bold = true }
        end,
        groups = {
            "CursorLineNr",
        },
    },
    {
        style = function(variant)
            return { fg = variant.palette.fg, bg = variant.palette.cursorline }
        end,
        groups = {
            "LspReferenceText",
            "LspReferenceRead",
            "LspReferenceWrite",
            "Visual",
        },
    },
    {
        style = function(variant)
            return { fg = variant.palette.fg, bg = menu_bg(variant) }
        end,
        groups = {
            "Pmenu",
            "BlinkCmpMenu",
            "BlinkCmpDoc",
            "BlinkCmpSignatureHelp",
        },
    },
    {
        style = function(variant)
            return { fg = variant.palette.fg, bg = variant.palette.cursorline, bold = true }
        end,
        groups = {
            "PmenuSel",
            "WildMenu",
            "BlinkCmpMenuSelection",
            "BlinkCmpDocCursorLine",
        },
    },
    {
        style = function(variant)
            return { fg = variant.palette.comment, bg = menu_bg(variant) }
        end,
        groups = {
            "PmenuKind",
            "PmenuExtra",
            "PmenuExtraSel",
            "BlinkCmpLabelDeprecated",
            "BlinkCmpLabelDetail",
            "BlinkCmpLabelDescription",
            "BlinkCmpSource",
            "BlinkCmpMenuBorder",
            "BlinkCmpDocBorder",
            "BlinkCmpDocSeparator",
            "BlinkCmpSignatureHelpBorder",
        },
    },
    {
        style = function(variant)
            return { fg = variant.palette.keyword, bg = menu_bg(variant), bold = true }
        end,
        groups = {
            "BlinkCmpLabelMatch",
        },
    },
    {
        style = function(variant)
            return { fg = variant.palette.fg, bg = menu_bg(variant) }
        end,
        groups = {
            "BlinkCmpLabel",
        },
    },
    {
        style = function(variant)
            return { fg = variant.palette.type, bg = menu_bg(variant) }
        end,
        groups = {
            "BlinkCmpKind",
        },
    },
    {
        style = function(variant)
            return { bg = menu_bg(variant) }
        end,
        groups = {
            "PmenuSbar",
            "BlinkCmpScrollBarGutter",
        },
    },
    {
        style = function(variant)
            return { bg = variant.palette.comment }
        end,
        groups = {
            "PmenuThumb",
            "BlinkCmpScrollBarThumb",
        },
    },
    {
        style = function(variant)
            return { fg = variant.palette.fg, bg = normal_bg(variant) }
        end,
        groups = {
            "StatusLine",
            "StatusLineTerm",
            "TabLineSel",
        },
    },
    {
        style = function(variant)
            return { fg = variant.palette.comment, bg = normal_bg(variant) }
        end,
        groups = {
            "StatusLineNC",
            "StatusLineTermNC",
            "TabLine",
            "TabLineFill",
        },
    },
    {
        style = function(variant)
            return { fg = variant.palette.fg, bg = normal_bg(variant) }
        end,
        groups = {
            "NormalFloat",
            "FloatTitle",
            "FloatFooter",
        },
    },
    {
        style = function(variant)
            return { fg = variant.palette.comment, bg = normal_bg(variant) }
        end,
        groups = {
            "FloatBorder",
            "WinSeparator",
            "VertSplit",
        },
    },
    {
        style = function(variant)
            return { fg = variant.palette.comment, italic = variant.comment_italic or false }
        end,
        groups = {
            "Comment",
            "@comment",
            "@comment.documentation",
            "@comment.todo",
            "@comment.note",
            "@comment.warning",
            "@comment.error",
        },
    },
    {
        style = function(variant)
            return { fg = variant.palette.keyword, bold = true }
        end,
        groups = {
            "Keyword",
            "Conditional",
            "Repeat",
            "Include",
            "Define",
            "Macro",
            "PreProc",
            "Type",
            "StorageClass",
            "Structure",
            "Typedef",

            "@keyword",
            "@keyword.import",
            "@keyword.function",
            "@keyword.return",
            "@keyword.conditional",
            "@keyword.conditional.ternary",
            "@keyword.repeat",
            "@keyword.exception",
            "@keyword.operator",
            "@keyword.type",
            "@keyword.modifier",
            "@keyword.directive",
            "@keyword.directive.define",
            "@attribute",
            "@attribute.builtin",
            "@label",
        },
    },
    {
        style = function(variant)
            return { fg = variant.palette.fg }
        end,
        groups = {
            "Exception",
        },
    },
    {
        style = function(variant)
            return { fg = variant.palette.string }
        end,
        groups = {
            "String",
            "Character",
            "@string",
            "@string.documentation",
            "@string.regexp",
            "@string.escape",
            "@string.special",
            "@string.special.symbol",
            "@string.special.url",
            "@string.special.path",
            "@character",
            "@character.special",
        },
    },
    {
        style = function(variant)
            return { fg = variant.palette.fg }
        end,
        groups = {
            "Identifier",
            "Function",
            "Number",
            "Boolean",
            "Float",
            "Operator",
            "Special",
            "Delimiter",

            "@module",
            "@module.builtin",
            "@variable",
            "@variable.builtin",
            "@variable.parameter",
            "@variable.parameter.builtin",
            "@variable.member",
            "@constant",
            "@constant.builtin",
            "@number",
            "@number.float",
            "@boolean",
            "@function",
            "@function.builtin",
            "@function.call",
            "@function.method",
            "@function.method.call",
            "@constructor",
            "@operator",
            "@property",
            "@punctuation.delimiter",
            "@punctuation.bracket",
            "@punctuation.special",
        },
    },
    {
        style = function(variant)
            return { fg = variant.palette.type, italic = true }
        end,
        groups = {
            "@type",
            "@type.builtin",
            "@type.definition",
        },
    },
}

---@param groups ThreeColorsGroup[]
---@param opts ThreeColorsHighlightOpts
local function apply(groups, opts)
    for _, group in ipairs(groups) do
        set(0, group, opts)
    end
end

---@param variant ThreeColorsVariant
function M.apply(variant)
    vim.cmd("highlight clear")
    if vim.fn.exists("syntax_on") == 1 then
        vim.cmd("syntax reset")
    end

    vim.g.colors_name = variant.name
    vim.opt.termguicolors = true

    if variant.background then
        vim.opt.background = variant.background
    end

    for _, spec in ipairs(highlight_groups) do
        apply(spec.groups, spec.style(variant))
    end
end

return M
