vim.pack.add({
    { src = "https://github.com/mfussenegger/nvim-dap" },
    { src = "https://github.com/nvim-neotest/nvim-nio" },
    { src = "https://github.com/rcarriga/nvim-dap-ui" },
    { src = "https://github.com/theHamsta/nvim-dap-virtual-text" },
    { src = "https://github.com/mfussenegger/nvim-dap-python" },
})

local dap = require("dap")
local dapui = require("dapui")

dapui.setup()
require("nvim-dap-virtual-text").setup({})
require("dap-python").setup("uv")

table.insert(dap.configurations.python, {
    type = "python",
    request = "launch",
    name = "DAP Django",
    program = function()
        return vim.fn.input("Path to manage.py: ", vim.fn.getcwd() .. "/", "file")
    end,
    args = { "runserver", "--noreload" },
    justMyCode = true,
    django = true,
    console = "integratedTerminal",
})

dap.listeners.before.attach.dapui_config = function()
    dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
    dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
    dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
    dapui.close()
end

vim.keymap.set("n", "<leader>n", dap.step_over, { silent = true })
vim.keymap.set("n", "<leader>o", dap.step_out, { silent = true })
vim.keymap.set("n", "<leader>i", dap.step_into, { silent = true })
vim.keymap.set("n", "<leader>d", dap.disconnect, { silent = true })
vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { silent = true })
vim.keymap.set("n", "<leader>c", dap.continue, { silent = true })
