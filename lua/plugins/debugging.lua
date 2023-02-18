return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "nvim-telescope/telescope-dap.nvim",
      "mfussenegger/nvim-dap-python",
    },
    config = function()
      -- Icons
      vim.fn.sign_define("DapBreakpoint", { text = "🚩" })
      vim.fn.sign_define("DapStopped", { text = "🟡" })
    end,
  },
  {
    "mfussenegger/nvim-dap-python",
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    config = function()
      local dap_python = require("dap-python")
      local dap = require("dap")

      dap_python.setup("python")
      table.insert(dap.configurations.python, {
        configurations = {
          justMyCode = false,
        },
      })
      dap_python.test_runner = "pytest"
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    config = true,
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    config = true,
  },
}
