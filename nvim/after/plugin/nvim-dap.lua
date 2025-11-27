local dap = require('dap')
require('nvim-dap-virtual-text').setup{}
vim.fn.sign_define("DapBreakpoint", {text='', texthl='ErrorMsg', linehl='', numhl=''})
vim.fn.sign_define("DapBreakpointCondition", {text='', texthl='ErrorMsg', linehl='', numhl=''})
vim.fn.sign_define("DapLogPoint", {text='', texthl='ErrorMsg', linehl='', numhl=''})
vim.keymap.set("n", "<F5>",  dap.continue, { desc = "DAP: Continue"})
vim.keymap.set("n", "<F6>",  dap.pause, { desc = "DAP: Restart"})
vim.keymap.set("n", "<F7>",  dap.restart, { desc = "DAP: Restart"})
vim.keymap.set("n", "<F8>", dap.terminate, { desc = "DAP: Terminate"})
vim.keymap.set("n", "<F10>", dap.step_over, { desc = "DAP: Step Over"})
vim.keymap.set("n", "<F11>", dap.step_into, { desc = "DAP: Step Into"})
vim.keymap.set("n", "<F12>", dap.step_out, { desc = "DAP: Step Out"})
vim.keymap.set("n", "<leader>dW", function()
    vim.ui.input({ prompt = "Watch variable: " }, function(expr)
        if not expr or expr == "" then return end
        require("dap").set_breakpoint({
            type = "watchpoint",
            expression = expr,
            accessType = "write" -- or "read", "readWrite"
        })
    end)
end, { desc = "DAP: Set Watchpoint" })

vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint)
vim.keymap.set('n', '<leader>dB', function()
  vim.ui.input({ prompt = "Condition: " }, function(cond)
    if cond and cond ~= "" then
      dap.set_breakpoint(cond)
    end
  end)
end, { desc = "DAP: Conditional Breakpoint"})
local function pick_executable(callback)
  require("fzf-lua").files({
    prompt = "Select executable > ",
    cwd = vim.fn.getcwd(),
    actions = {
      ["default"] = function(selected)
        callback(selected[1])
      end,
    },
  })
end
dap.adapters.lldb = {
  type = "executable",
  command = vim.fn.exepath('lldb-dap'),
  name = "lldb",
}

dap.adapters.coreclr = {
  type = "executable",
  command = vim.fn.exepath("netcoredbg"),
  args = { "--interpreter=vscode" },
}

local dapview = require('dap-view')
dap.listeners.after.event_initialized["dapview_config"] = dapview.open
dap.listeners.before.event_terminated["dapview_config"] = dapview.close
dap.listeners.before.event_exited["dapview_config"]    = dapview.close
