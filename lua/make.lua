vim.api.nvim_create_autocmd("FileType", {
    pattern = { "htmldjango", "html" },
    callback = function(args)
        vim.bo[args.buf].makeprg = "djlint --lint --reformat --quiet %"
    end
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "python" },
    callback = function(args)
        vim.bo[args.buf].makeprg = "ruff format %"
    end
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "typescript", "javascript", "typescriptreact", "javascriptreact" },
    callback = function(args)
        vim.bo[args.buf].makeprg = "eslint --fix %"
    end
})

vim.keymap.set("n", "<leader>m", "<cmd>w<cr><cmd>make<cr>")
