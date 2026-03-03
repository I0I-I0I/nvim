return {
    settings = {
        Lua = {
            telemetry = { enable = false },
            path = vim.split(package.path, ";"),
            workspace = {
                checkThirdParty = false,
                maxPreload = 1000,
                preloadFileSize = 100,
                library = {
                    vim.env.VIMRUNTIME,
                },
            },
        },
    },
}
