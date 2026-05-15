local M = {}

local agents = { "gemini", "codex", "pi", "opencode" }

local function get_display_name(bufnr)
    local cached = vim.b[bufnr].tabline_name
    if cached then return cached end

    local name = vim.api.nvim_buf_get_name(bufnr)
    local buftype = vim.bo[bufnr].buftype
    local display_name = ""

    if name == "" then
        display_name = "[No Name]"
    elseif buftype == "terminal" then
        local matched_agent = nil
        for _, agent in ipairs(agents) do
            if string.find(name, "%f[%w]" .. agent .. "%f[%W]") then
                matched_agent = agent
                break
            end
        end

        if matched_agent then
            display_name = "Agent(" .. matched_agent .. ")"
        else
            local shell = name:match("([^/]+)$") or "term"
            display_name = "Term(" .. shell .. ")"
        end
    else
        display_name = vim.fn.fnamemodify(name, ":t")
    end

    vim.b[bufnr].tabline_name = display_name
    return display_name
end

function _G.CustomTabLine()
    local s = {}
    local tabpages = vim.api.nvim_list_tabpages()
    local current_tab = vim.api.nvim_get_current_tabpage()

    for i, tab in ipairs(tabpages) do
        if tab == current_tab then
            table.insert(s, "%#TabLineSel#")
        else
            table.insert(s, "%#TabLine#")
        end

        table.insert(s, "%" .. i .. "T")
        table.insert(s, " " .. i .. ": ")

        local win = vim.api.nvim_tabpage_get_win(tab)
        local bufnr = vim.api.nvim_win_get_buf(win)
        local display_name = get_display_name(bufnr)

        table.insert(s, display_name .. " ")
    end

    table.insert(s, "%#TabLineFill#%T")

    return table.concat(s)
end

function M.setup()
    vim.o.tabline = "%!v:lua.CustomTabLine()"

    vim.api.nvim_create_autocmd({ "TermOpen", "BufWinEnter", "BufWritePost" }, {
        group = vim.api.nvim_create_augroup("TablineCache", { clear = true }),
        callback = function(ev)
            vim.b[ev.buf].tabline_name = nil
        end,
    })
end

return M
