local mason_registry = require("mason-registry")
local svelte_lsp_path = mason_registry.get_package("svelte-language-server"):get_install_path()
local svelte_ts_plugin_path = svelte_lsp_path .. "/node_modules/typescript-svelte-plugin"

return {
    fyletypes = { "javascript", "typescript", "jsx", "tsx", "svelte" },
    settings = {
        typescript = {
            tsserver = {
                maxTsServerMemory = 4096,
                experimental = { enableProjectDiagnostics = true },
                globalPlugins = {
                    {
                        name = "typescript-svelte-plugin",
                        location = svelte_ts_plugin_path,
                        enableForWorkspaceTypeScriptVersions = true,
                    },
                },
            },
        },
    }
}
