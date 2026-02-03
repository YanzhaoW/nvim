local dap = require "dap"

local dapui = require "dapui"

dapui.setup()

dap.set_log_level 'TRACE'

dap.adapters.gdb = {
    type = "executable",
    command = "gdb",
    -- args = { "--interpreter=dap", "--eval-command", "set print pretty on", },
    args = { "--interpreter=dap", },
}

dap.adapters.lldb = { type = 'executable', command = 'lldb-dap', name = 'lldb', }

dap.configurations.cpp = {
    {
        name = 'Launch',
        type = 'lldb',
        request = 'launch',
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/build/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
        args = {},
    },
}

dap.adapters.python = function(cb, config)
    if config.request == 'attach' then
        ---@diagnostic disable-next-line: undefined-field
        local port = (config.connect or config).port
        ---@diagnostic disable-next-line: undefined-field
        local host = (config.connect or config).host or '127.0.0.1'
        cb {
            type = 'server',
            port = assert(port, '`connect.port` is required for a python `attach` configuration'),
            host = host,
            options = { source_filetype = 'python', },
        }
    else
        cb {
            type = 'executable',
            command = 'debugpy-adapter',
            options = { source_filetype = 'python', },
        }
    end
end


dap.configurations.python = {
    {
        -- The first three options are required by nvim-dap
        type = 'python', -- the type here established the link to the adapter definition: `dap.adapters.python`
        request = 'launch',
        name = "Launch file",

        -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

        -- program = "${file}", -- This configuration will launch the current file if used.
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd(), 'file')
        end,
        pythonPath = function()
            -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
            -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
            -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
            local virtual_env = os.getenv "VIRTUAL_ENV"
            local cwd = vim.fn.getcwd()
            if virtual_env ~= nil then
                local command = os.getenv "VIRTUAL_ENV" .. "/bin/python"
                if vim.fn.executable(cwd .. command) == 1 then
                    return cwd .. command
                elseif vim.fn.executable(cwd .. command) == 1 then
                    return cwd .. '/.venv/bin/python'
                else
                    return 'python3'
                end
            else
                return 'python3'
            end
        end,
        console = "integratedTerminal",
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
