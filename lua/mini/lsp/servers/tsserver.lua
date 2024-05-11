autocmd("FileType", {
    pattern = {
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "typescript",
        "typescriptreact",
        "typescript.tsx",
    },
    callback = function()
        vim.lsp.start({
            capabilities = capabilities,
            cmd = { "typescript-language-server", "--stdio" },
            filetypes = {
                "javascript",
                "javascriptreact",
                "javascript.jsx",
                "typescript",
                "typescriptreact",
                "typescript.tsx",
            },
            init_options = {
                hostInfo = "neovim",
            },
            root_dir = vim.fn.getcwd(),
            single_file_support = true,
            settings = {
                experemental = {
                    enableProjectDiagnostics = true,
                },
            },
        })
    end,
})
