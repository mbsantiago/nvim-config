return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "nvim-telescope/telescope-dap.nvim",
      "mfussenegger/nvim-dap-python",
    },
    init = function()
      -- Icons
      vim.fn.sign_define("DapBreakpoint", { text = "🚩" })
      vim.fn.sign_define("DapStopped", { text = "🟡" })
    end,
    keys = {
      {
        "<leader>dc",
        "<cmd>lua require('dap').continue()<cr>",
        desc = "Debug Continue",
      },
      {
        "<leader>db",
        "<cmd>lua require('dap').toggle_breakpoint()<cr>",
        desc = "Debug Toggle Breakpoint",
      },
      {
        "<leader>dr",
        "<cmd>lua require('dap').repl.open()<cr>",
        desc = "Debug Open REPL",
      },
      {
        "<leader>dl",
        "<cmd>lua require('dap').run_last()<cr>",
        desc = "Debug Last Run",
      },
      {
        "<leader>dn",
        "<cmd>lua require('dap').step_over()<cr>",
        desc = "Debug Step Next",
      },
      {
        "<leader>di",
        "<cmd>lua require('dap').step_into()<cr>",
        desc = "Debug Step Into",
      },
      {
        "<leader>do",
        "<cmd>lua require('dap').step_out()<cr>",
        desc = "Debug Step Out",
      },
    },
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
    keys = {
      {
        "<leader>dm",
        "<cmd>lua require('dap-python').test_method()<cr>",
        desc = "Debug Test Method",
      },
      {
        "<leader>dk",
        "<cmd>lua require('dap-python').test_class()<cr>",
        desc = "Debug Test Class",
      },
      {
        "<leader>dv",
        "<cmd>lua require('dap-python').debug_selection()<cr>",
        desc = "Debug Selection",
      },
    },
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    config = true,
    keys = {
      {
        "<leader>dt",
        "<cmd>lua require('dapui').toggle()<cr>",
        desc = "Debug Toggle UI",
      },
    },
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    config = true,
  },
}
