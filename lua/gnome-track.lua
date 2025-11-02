local M = {}

---@alias Scheme "prefer-dark"|"default"|"prefer-light"|"default"

---@type integer|nil
local job_id = nil

---@param command string
---@return string[]
local function get_cmd(command)
    return { "gsettings", command, "org.gnome.desktop.interface", "color-scheme" }
end

---@param line string?
---@return Scheme|nil
local function extract_value(line)
    if not line then return nil end
    local v = line:match("'([^']+)'")
    if v ~= "prefer-dark" and v ~= "default" and v ~= "prefer-light"
        and v ~= "default" then
        return
    end
    return v
end

---@param cb fun(scheme:Scheme)
function M.setup(cb)
    if job_id and job_id > 0 then return end

    local success, output = pcall(function()
        return vim.system(get_cmd("get")):wait()
    end)
    if not success then
        cb("prefer-dark")
        vim.notify("[ERROR] Gnome-track: " .. output.stderr, vim.log.levels.ERROR)
        return
    end
    local current_theme = extract_value(output.stdout) or "prefer-dark"
    cb(current_theme)

    vim.api.nvim_create_autocmd("VimLeavePre", {
        callback = function()
            M.stop()
        end
    })

    job_id = vim.fn.jobstart(
        get_cmd("monitor"),
        {
            stdout_buffered = false,
            on_stdout = function(_, data, _)
                local line = data[1]
                if not line or line == "" then
                    return
                end

                local v = extract_value(line)
                if v then
                    vim.schedule(function()
                        cb(v)
                        vim.notify("Gnome-track: " .. v, vim.log.levels.INFO)
                    end)
                end
            end,
            on_stderr = function(_, _data, _)
                vim.notify("[ERROR] Gnome-track: " .. _data, vim.log.levels.ERROR)
            end,
            on_exit = function(_, _, _)
                job_id = nil
            end,
        }
    )
end

function M.stop()
    if job_id and job_id > 0 then
        pcall(vim.fn.jobstop, job_id)
        job_id = nil
    end
end

return M
