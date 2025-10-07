vim.cmd([[
function! Format(type, ...)
    normal! '[v']gq
    if v:shell_error > 0
        silent undo
        redraw
        echomsg 'formatprg "' . &formatprg . '" exited with status ' . v:shell_error
    endif
    if exists('w:gqview')
        call winrestview(w:gqview)
        unlet w:gqview
    endif
endfunction ]])

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "htmldjango", "html" },
    callback = function(args)
        vim.bo[args.buf].makeprg = "djlint --lint --reformat --quiet %"
    end })

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "python" },
    callback = function(args)
        -- Lint the current file with :make
        vim.bo[args.buf].makeprg = "uv run ruff check --output-format=pylint"
        -- Format selection with 'gq'
        vim.bo[args.buf].formatprg = "uv run ruff format --stdin-filename %"
        vim.bo[args.buf].formatexpr = ""
        vim.keymap.set("n", "<leader>f", "<cmd>w<cr><cmd>!uv run ruff format<cr>",
            { silent = true })
        vim.keymap.set("n", "<leader>F", function()
            vim.cmd("write")
            vim.cmd([[!uv run ruff format]])
            vim.cmd([[!uv run ruff check --fix >/dev/null]])
        end, { silent = true, noremap = true })
        vim.keymap.set("n", "<leader>m", function()
            vim.bo[args.buf].errorformat = "%f:%l: %m"
            vim.bo[args.buf].makeprg = "uv run ruff check --output-format=pylint"
            vim.cmd([[
                w
                silent make
                copen
                wincmd p]])
        end, { noremap = true })
        vim.keymap.set("n", "grd", function()
            vim.bo[args.buf].errorformat = "%f:%l:%c - %m,%+C %m"
            vim.bo[args.buf].makeprg = "pyright"
            vim.cmd([[
                w
                silent make
                copen
                wincmd p]])
        end, { noremap = true })
    end })

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "typescript", "javascript", "typescriptreact", "javascriptreact" },
    callback = function(args)
        vim.bo[args.buf].makeprg = "eslint --fix %"
    end })

vim.keymap.set("n", "<leader>m", "<cmd>w<cr><cmd>silent make<cr><cmd>copen<cr><cmd>wincmd p<cr>")
vim.keymap.set("n", "<leader>f", "<cmd>w<cr>mfgggqG`fzz")
