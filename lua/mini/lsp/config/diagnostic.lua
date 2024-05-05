-- Diagnostic
vim.diagnostic.config({
    virtual_text = true,
    sighns = true,
    underline = true,
    severity_sort = true,
    update_in_insert = false,
    float = {
        focusable = false,
        border = "single",
        header = "",
        prefix = "",
    }
})

