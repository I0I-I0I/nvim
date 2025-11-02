local function reinstall_all_pack_plugins()
    local packs = vim.pack.get(nil, { info = true })
    if not packs or #packs == 0 then
        vim.notify("vim.pack: no managed plugins found", vim.log.levels.INFO)
        return
    end

    ---@type string[]
    local names = {}

    for _, p in ipairs(packs) do
        if not p.active then
            goto continue
        end
        table.insert(names, p.spec.name)
        ::continue::
    end

    vim.notify("vim.pack: update plugins", vim.log.levels.INFO)
    vim.pack.update(names, { load = true, confirm = false })
    vim.notify("vim.pack: update complete.", vim.log.levels.INFO)
end

local function delete_plugins()
    local packs = vim.pack.get(nil, { info = true })
    if not packs or #packs == 0 then
        vim.notify("vim.pack: no managed plugins found", vim.log.levels.INFO)
        return
    end

    ---@type string[]
    local names = {}

    for _, p in ipairs(packs) do
        local spec = p.spec or {}
        local name = spec.name or spec.src

        if p.active then
            goto continue
        end

        if type(name) == "string" and name ~= "" then
            if not name:match("^[%w%-%.%_]+/[%w%-%.%_]+$") and not name:match("^[%w%-%.%_]+%.nvim$") then
                vim.notify("Suspicious plugin name: " .. name, vim.log.levels.WARN)
            end
            table.insert(names, name)
        else
            vim.notify("Skipping invalid plugin: " .. vim.inspect(spec), vim.log.levels.ERROR)
        end

        ::continue::
    end

    if #names == 0 then
        vim.notify("No valid plugin names found to delete", vim.log.levels.WARN)
        return
    end

    print("Deleting plugins: " .. vim.inspect(names))

    for _, name in ipairs(names) do
        local success, err = pcall(vim.pack.del, { name })
        if not success then
            vim.notify("Failed to delete " .. name .. ": " .. err, vim.log.levels.ERROR)
        else
            vim.notify("Deleted plugin: " .. name, vim.log.levels.INFO)
        end
    end
end

vim.api.nvim_create_user_command('PackUpdateAll', reinstall_all_pack_plugins, { nargs = 0 })
vim.api.nvim_create_user_command('PackDeleteAll', delete_plugins, { nargs = 0 })
