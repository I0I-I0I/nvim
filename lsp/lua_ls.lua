return {
    settings = {
        Lua = {
            telemetry = { enable = false },
            path = vim.split(package.path, ";"),
            workspace = {
                checkThirdParty = true,
                library = {
                    vim.env.VIMRUNTIME,
                }
            }
        }
    }
}
