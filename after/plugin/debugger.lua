local dap, dapui =require("dap"),require("dapui")

dap.listeners.after.event_initialized["dapui_config"]=function()
   dapui.open()
end

dap.listeners.before.event_terminated["dapui_config"]=function()
   dapui.close()
end

dap.listeners.before.event_exited["dapui_config"]=function()
   dapui.close()
end


vim.fn.sign_define('DapBreakpoint',{ text ="\u{25CF}", texthl ='', linehl ='', numhl =''})
vim.fn.sign_define('DapStopped',{ text ="\u{25B6}", texthl ='', linehl ='', numhl =''})

vim.keymap.set('n', '<F5>', dap.continue)
vim.keymap.set('n', '<F10>', dap.step_over)
vim.keymap.set('n', '<F11>', dap.step_into)
vim.keymap.set('n', '<F12>', dap.step_out)
vim.keymap.set('n', '<leader>bb', dap.toggle_breakpoint)
vim.keymap.set('n', '<leader>dd', dapui.toggle)



