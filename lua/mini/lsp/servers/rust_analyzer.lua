autocmd("FileType", {
    pattern = { "rust" },
    callback = function()
        vim.lsp.start({
            capabilities = capabilities,
            cmd = { "rust_analyzer", "--stdio" },
            init_options = {
                hostInfo = "neovim"
            },
            root_dir = vim.fn.getcwd(),
            single_file_support = true,
        })
    end
})
