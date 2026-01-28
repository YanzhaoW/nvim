local dap = require "dap"

dapui = require "dapui"

dapui.setup()

dap.set_log_level 'TRACE'

dap.adapters.gdb = {
    type = "executable",
    command = "gdb",
    -- args = { "--interpreter=dap", "--eval-command", "set print pretty on", },
    args = { "--interpreter=dap", },
}

dap.configurations.cpp = {
    {
        name = "Launch",
        type = "gdb",
        request = "launch",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/build/', 'file')
        end,
        args = {}, -- provide arguments if needed
        cwd = "${workspaceFolder}",
        stopAtBeginningOfMainSubprogram = false,
    },
    {
        name = "Select and attach to process",
        type = "gdb",
        request = "attach",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        pid = function()
            local name = vim.fn.input 'Executable name (filter): '
            return require "dap.utils".pick_process { filter = name, }
        end,
        cwd = '${workspaceFolder}',
    },
    {
        name = 'Attach to gdbserver :1234',
        type = 'gdb',
        request = 'attach',
        target = 'localhost:1234',
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
    },
}


dapui.setup {
    layouts = {
        {
            elements = {
                { id = "watches",     size = 0.15, },
                { id = "stacks",      size = 0.15, },
                { id = "breakpoints", size = 0.15, },
                { id = "scopes",      size = 0.55, },
            },
            position = "right",
            size = 70,
        },
        {
            elements = {
                { id = "repl",    size = 0.5, },
                { id = "console", size = 0.5, },
            },
            position = "bottom",
            size = 10,
        },
    },
}

vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticError", })

vim.fn.sign_define("DapStopped", { text = "", texthl = "DiagnosticWarn", })

vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "DiagnosticHint", })






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
