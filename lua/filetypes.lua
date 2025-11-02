vim.api.nvim_create_autocmd("FileType", {
    pattern = { "htmldjango", "html" },
    callback = function(args)
        vim.bo[args.buf].makeprg = "djlint --lint --reformat --quiet %"
    end
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "python" },
    callback = function(args)
        vim.bo[args.buf].formatprg = "uv run ruff format --stdin-filename %"
        vim.bo[args.buf].formatexpr = ""
        vim.keymap.set("n", "<leader>k", function()
            local pack = vim.fn.input("Package: ")
            if pack == "" then
                return
            end
            vim.cmd("!uv run python -m pydoc " .. pack)
        end, { noremap = true })

        local function parse_pyright(text)
            if text == "" then return {} end
            local ok, data = pcall(vim.fn.json_decode, text)
            if not ok or type(data) ~= "table" then return {} end
            local diags = data.generalDiagnostics or {}
            local items = {}
            for _, d in ipairs(diags) do
                local file = d.file or d.uri
                if file and file:match("^file://") and vim.uri_to_fname then file = vim.uri_to_fname(file) end
                if file then
                    local start = (d.range and d.range.start) or {}
                    table.insert(items, {
                        filename = file,
                        lnum     = (start.line and start.line + 1) or 1,
                        col      = (start.character and start.character + 1) or 1,
                        text     = d.message or d.messageText or "",
                        type     = (d.category and d.category:sub(1, 1):upper()) or "E",
                    })
                end
            end
            return items
        end

        local function parse_ruff(text)
            if text == "" then return {} end
            local ok, arr = pcall(vim.fn.json_decode, text)
            if not ok or type(arr) ~= "table" then return {} end
            local items = {}
            for _, e in ipairs(arr) do
                local file = e.path or e.filename or e.file
                if file then
                    local l = e.row or e.line or 1
                    local c = e.col or e.column or 1
                    table.insert(items, {
                        filename = file,
                        lnum     = l,
                        col      = c,
                        text     = (e.code and (e.code .. ": ") or "") .. (e.message or ""),
                        type     = "W",
                    })
                end
            end
            return items
        end

        function _G.lint_pyright_and_ruff()
            local pyright_out = vim.fn.system("pyright --outputjson")
            local ruff_out    = vim.fn.system("ruff check --output-format json .")
            local items       = {}
            vim.list_extend(items, parse_pyright(pyright_out))
            vim.list_extend(items, parse_ruff(ruff_out))
            vim.fn.setqflist(items, "r")
            vim.cmd("copen")
        end

        vim.api.nvim_create_user_command("LintPy", "lua _G.lint_pyright_and_ruff()", {})
        vim.keymap.set("n", "<leader>m", "<cmd>LintPy<CR>", { noremap = true, silent = true })
    end
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "typescript", "javascript", "typescriptreact", "javascriptreact" },
    callback = function(args)
        vim.bo[args.buf].makeprg = "eslint --fix %"
    end
})

vim.keymap.set("n", "<leader>m", "<cmd>w<cr><cmd>silent make<cr><cmd>copen<cr><cmd>wincmd p<cr>")
