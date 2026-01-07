local M = {}

---@type {[string]: {
---    name: string,
---    langs: string[],
---    type: {
---        lsp?: vim.lsp.Config,
---        formatter?: {cmd?: string},
---        linter?: {cmd?: string, errorformat?: string}}}}
local lsps = {
    ["pyrefly"] = {
        name = "pyrefly",
        type = {
            lsp = {
                cmd = { "pyrefly", "lsp" },
                pyrefly = {
                    analysis = {
                        diagnosticMode = "workspace",
                    },
                    displayTypeErrors = "force-on",
                },
            },
            linter = {
                cmd = "pyrefly check --output-format github",
                errorformat = "::%t%*[^ ] file=%f\\,line=%l\\,col=%c\\,endLine=%e\\,endColumn=%k%*[^:]::%m,"
                    .. "::%t%*[^ ] file=%f\\,line=%l\\,col=%c%*[^:]::%m",
            },
        },
        langs = { "python" },
    },
    ["pyright"] = {
        name = "pyright",
        type = { linter = { cmd = "uv run pyright" } },
        langs = { "python" },
    },
    -- ["ty"] = {
    --     name = "ty",
    --     type = {
    --         lsp = {
    --             cmd = { "uv", "tool", "run", "ty", "server" },
    --             filetypes = { "python" },
    --             root_markers = { "ty.toml", "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", ".git" },
    --             settings = {
    --                 ty = { diagnosticMode = "workspace" },
    --             },
    --         },
    --     },
    --     langs = { "python" },
    -- },
    ["clangd"] = {
        name = "clangd",
        type = { lsp = {} },
        langs = { "c", "cpp" },
    },
    ["css-lsp"] = {
        name = "cssls",
        type = { lsp = {} },
        langs = { "css" },
    },
    ["css-variables-language-server"] = {
        name = "cssvar",
        type = { lsp = {} },
        langs = { "css" },
    },
    ["emmet-language-server"] = {
        name = "emmet_language_server",
        type = {
            lsp = {
                cmd = { "emmet-language-server", "--stdio" },
                filetypes = {
                    "astro",
                    "css",
                    "eruby",
                    "html",
                    "htmlangular",
                    "htmldjango",
                    "javascriptreact",
                    "less",
                    "pug",
                    "sass",
                    "scss",
                    "svelte",
                    "templ",
                    "typescriptreact",
                    "vue",
                },
                root_markers = { ".git" },
            },
        },
        langs = {
            "html",
            "css",
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
        },
    },
    ["html-lsp"] = {
        name = "html",
        type = {
            lsp = {
                cmd = { "vscode-html-language-server", "--stdio" },
                filetypes = { "html", "templ", "htmldjango" },
                root_markers = { "package.json", ".git" },
                settings = {},
                init_options = {
                    provideFormatter = true,
                    embeddedLanguages = { css = true, javascript = true },
                    configurationSection = { "html", "css", "javascript" },
                },
            },
        },
        langs = { "html" },
    },
    ["lua-language-server"] = {
        name = "lua_ls",
        type = {
            lsp = {
                settings = {
                    Lua = {
                        telemetry = { enable = false },
                        path = vim.split(package.path, ";"),
                        workspace = {
                            checkThirdParty = false,
                            library = {
                                vim.env.VIMRUNTIME,
                            },
                        },
                    },
                },
            },
        },
        langs = { "lua" },
    },
    ["typescript-language-server"] = {
        name = "ts_ls",
        type = { lsp = {} },
        langs = {
            "typescript",
            "typescriptreact",
            "javascript",
            "javascriptreact",
        },
    },

    ["biome"] = {
        name = "biome",
        type = {
            lsp = {},
            formatter = { cmd = "bun run biome format --write --stdin-file-path=%q" },
            linter = {
                cmd = "bun run biome check --reporter=github --colors=off",
                errorformat = "::%t%*[a-z] title=%*[a-z0-9/]\\,file=%f\\,line=%l\\,endLine=%e\\,col=%c\\,endColumn=%k::%m,"
                    .. "::%t%*[a-z] title=%*[a-z0-9/]\\,file=%f\\,line=%l\\,endline=%e\\,col=%c\\,endcolumn=%k::%m",
            },
        },
        langs = {
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
        },
    },
    ["ruff"] = {
        name = "ruff",
        type = {
            lsp = {},
            formatter = { cmd = "uv tool run ruff format --stdin-filename %q" },
            linter = { cmd = "uv run ruff check" },
        },
        langs = { "python" },
    },
    ["prettier"] = {
        name = "prettier",
        type = { formatter = { cmd = "bun run prettier --stdin-filepath %q" } },
        langs = { "css", "html" },
    },
    ["stylua"] = {
        name = "stylua",
        type = {
            formatter = { cmd = "stylua --indent-type=spaces --stdin-filepath %q -" },
        },
        langs = { "lua" },
    },
    ["shellcheck"] = {
        name = "shellcheck",
        type = { linter = { cmd = "shellcheck -f gcc" } },
        langs = { "bash" },
    },
}

M.get_lsps = function()
    return lsps
end

M.get_lsps_names = function()
    local lsp_servers = {}
    for _, lsp_server in pairs(lsps) do
        if vim.list_contains(vim.tbl_keys(lsp_server.type), "lsp") then
            table.insert(lsp_servers, lsp_server.name)
        end
    end
    return lsp_servers
end

M.setup_formatters = function()
    local formatters = {
        python = lsps["ruff"].type.formatter,
        html = lsps["prettier"].type.formatter,
        css = lsps["prettier"].type.formatter,
        javascript = lsps["biome"].type.formatter,
        javascriptreact = lsps["biome"].type.formatter,
        typescript = lsps["biome"].type.formatter,
        typescriptreact = lsps["biome"].type.formatter,
        lua = lsps["stylua"].type.formatter,
    }

    vim.api.nvim_create_autocmd("FileType", { -- formatting with `gq`
        pattern = vim.tbl_keys(formatters),
        callback = function(args)
            local cur_opt = vim.bo[args.buf]
            local fname = vim.api.nvim_buf_get_name(args.buf)
            cur_opt.formatprg = string.format(formatters[cur_opt.filetype].cmd, fname)
        end,
    })
end

M.setup_linters = function()
    local linters = {
        python = lsps["pyrefly"].type.linter,
        bash = lsps["shellcheck"].type.linter,
        html = lsps["biome"].type.linter,
        css = lsps["biome"].type.linter,
        javascript = lsps["biome"].type.linter,
        javascriptreact = lsps["biome"].type.linter,
        typescript = lsps["biome"].type.linter,
        typescriptreact = lsps["biome"].type.linter,
    }

    vim.api.nvim_create_autocmd("FileType", { -- linting with `make`
        pattern = vim.tbl_keys(linters),
        callback = function(args)
            local cur_opt = vim.bo[args.buf]
            if linters[cur_opt.filetype].errorformat then
                cur_opt.errorformat = linters[cur_opt.filetype].errorformat
            end
            cur_opt.makeprg = linters[cur_opt.filetype].cmd
        end,
    })
end

M.setup_lsps = function()
    for _, lsp_server in pairs(lsps) do
        if not vim.list_contains(vim.tbl_keys(lsp_server.type), "lsp") then
            goto continue
        end

        local lsp_config = lsp_server.type.lsp
        if lsp_config == nil or next(lsp_config) == nil then
            vim.lsp.enable(lsp_server.name)
            goto continue
        end

        vim.lsp.config(lsp_server.name, lsp_config)
        vim.lsp.enable(lsp_server.name)

        ::continue::
    end
end

M.lsps_server_install = function()
    local lsp_servers = vim.tbl_keys(lsps)
    for _, lsp_server in ipairs(lsp_servers) do
        if vim.fn.executable(lsp_server) == 0 then
            vim.cmd("MasonInstall " .. lsp_server)
        end
    end
end

return M
