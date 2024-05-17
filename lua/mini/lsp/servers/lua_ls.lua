autocmd("FileType", {
    pattern = { "lua" },
    callback = function()
        vim.lsp.start({
            capabilities = capabilities,
            cmd = { "lua-language-server" },
            init_options = {
                hostInfo = "neovim",
            },
            root_dir = vim.fn.getcwd(),
            settings = {
                Lua = {
                    diagnostics = {
                        globals = {
                            "vim",
                            "augroup",
                            "autocmd",
                            "capabilities",
                            "sources",
                        },
                    },
                },
            },
            single_file_support = true,
        })
    end,
})
