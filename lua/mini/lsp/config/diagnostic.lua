-- Diagnostic
vim.diagnostic.config({
    virtual_text = false,
    update_in_insert = true,
    sighns = true,
    underline = true,
    severity_sort = true,
    float = {
        focusable = false,
        border = false,
        header = "",
        prefix = "",
    },
})
