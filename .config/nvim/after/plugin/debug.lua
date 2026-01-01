local dap = require('dap')
local dap_view = require('dap-view')

local executable_path = nil

local function set_executable_path()
    executable_path = vim.fn.input('(lldb) Path to executable: ', vim.fn.getcwd() .. '/', 'file')
end

vim.api.nvim_create_user_command("DapSetPath", set_executable_path, {})

vim.keymap.set('n', '<F5>', function() dap.continue() end, { desc = 'Debug: Start/Continue' })
vim.keymap.set('n', '<F6>', function() dap_view.toggle() end, { desc = 'Debug: View DAP' })
vim.keymap.set('n', '<F7>', function() vim.cmd("DapViewWatch") end, { desc = 'Debug: Watch variable' })
vim.keymap.set('n', '<F17>', function() dap.terminate() end, { desc = 'Debug: Stop (Shift + F5)' })
vim.keymap.set('n', '<F9>', function() dap.toggle_breakpoint() end, { desc = 'Debug: Toggle breakpoint' })
vim.keymap.set('n', '<F10>', function() dap.step_over() end, { desc = 'Debug: Step over' })
vim.keymap.set('n', '<F11>', function() dap.step_into() end, { desc = 'Debug: Step into' })
vim.keymap.set('n', '<F23>', function() dap.step_out() end, { desc = 'Debug: Step out (Shift + F11)' })
vim.keymap.set('n', '<F45>', function() dap.clear_breakpoints() end,
    { desc = 'Debug: Clear breakpoints (Ctrl + Shift + F9)' })

dap.adapters.lldb = {
    type = 'executable',
    command = '/usr/bin/lldb-dap',
    name = 'lldb'
}

dap.configurations.c = {
    {
        name = 'Launch',
        type = 'lldb',
        request = 'launch',
        program = function()
            if not executable_path then
                set_executable_path()
            end

            return executable_path
        end,
        -- vscode only? cwd = '${workspaceFolder}',
        stopOnEntry = false,
        args = {},
    },
}

dap.configurations.cpp = dap.configurations.c
dap.configurations.rust = dap.configurations.c
dap.configurations.zig = dap.configurations.c
