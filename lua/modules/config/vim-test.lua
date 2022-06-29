return function()
  vim.g["test#python#pytest#options"] = "--color=yes"
  vim.g["test#javascript#jest#options"] = "--color=yes"
  vim.g["test#javascript#runner"] = "jest"

  local ultest = safe_require("ultest")

  if not ultest then
    return
  end

  vim.g.ultest_use_pty = 1
  vim.g.ultest_virtual_text = 1

  local function python_runner(cmd)
    -- The command can start with python command directly or an env manager
    local non_modules = { "python", "pipenv", "poetry" }
    -- Index of the python module to run the test.
    local module_index = 1
    if vim.tbl_contains(non_modules, cmd[1]) then
      module_index = 3
    end
    local module = cmd[module_index]

    -- Remaining elements are arguments to the module
    local args = vim.list_slice(cmd, module_index + 1)
    return {
      dap = {
        type = "python",
        request = "launch",
        module = module,
        args = args,
      },
    }
  end

  ultest.setup({
    builders = {
      python = python_runner,
    },
  })
end
