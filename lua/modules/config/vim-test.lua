

return function()
  local neotest = safe_require("neotest")
  local neotest_python = safe_require("neotest-python")
  local neotest_jest = safe_require("neotest-jest")

  if not neotest or not neotest_python or not neotest_jest then
    return
  end

  neotest.setup({
    output = {
      enabled = true,
      open_on_run = "false",
    },
    adapters = {
      neotest_python({
        dap = { justMyCode = false },
        args = { "--log-level", "DEBUG" },
        runner = "pytest",
      }),
      neotest_jest({}),
    },
  })
end
