autocmd("FileType", {
    pattern = { "python" },
    callback = function()
        vim.lsp.start({
            capabilities = capabilities,
            cmd = { "pyright-langserver", "--stdio" },
            init_options = {
                hostInfo = "neovim"
            },
            root_dir = vim.fn.getcwd(),
            settings = {
                python = {
                    analysis = {
                        autoSearchPaths = true,
                        diagnosticMode = "openFilesOnly",
                        useLibraryCodeForTypes = true
                    }
                }
            },
            single_file_support = true,
        })
    end
})
