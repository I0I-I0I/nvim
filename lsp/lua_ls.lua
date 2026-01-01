return {
    settings = {
        Lua = {
            telemetry = { enable = false },
            path = vim.split(package.path, ";"),
            workspace = {
                checkThirdParty = false,
                library = {
                    vim.env.VIMRUNTIME,
                }
            }
        }
    }
}
