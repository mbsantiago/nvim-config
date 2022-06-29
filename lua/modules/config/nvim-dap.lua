return function()
  local dap = safe_require("dap")

  if not dap then
    return
  end

  vim.fn.sign_define("DapBreakpoint", { text = "🚩" })
  vim.fn.sign_define("DapStopped", { text = "🟡" })

  -- Python DAP configs
  local dap_python = safe_require("dap-python")

  if not dap_python then
    return
  end

  dap_python.setup("python")
  table.insert(dap.configurations.python, {
    configurations = {
      justMyCode = false,
    }
  })
  dap_python.test_runner = "pytest"

  -- Better UI
  local dapui = safe_require("dapui")

  if not dapui then
    return
  end

  dapui.setup()

  -- Virtual text with debugger info

  local dap_virtual_text = safe_require("nvim-dap-virtual-text")

  if not dap_virtual_text then
    return
  end

  dap_virtual_text.setup()
end
