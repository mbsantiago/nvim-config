return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/neotest-python",
      "haydenmeade/neotest-jest",
      "nvim-lua/plenary.nvim",
      "nvim-neotest/nvim-nio",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
    },
    lazy = true,
    config = function()
      local neotest = require("neotest")
      local neotest_python = require("neotest-python")
      local neotest_jest = require("neotest-jest")
      ---@diagnostic disable-next-line: missing-fields
      neotest.setup({
        quickfix = {
          enabled = false,
          open = false,
        },
        output = {
          enabled = true,
          open_on_run = false,
        },
        adapters = {
          neotest_python({
            python = ".venv/bin/python",
            dap = { justMyCode = false },
            args = { "--log-level", "DEBUG" },
            runner = "pytest",
          }),
          neotest_jest({}),
        },
      })
    end,
    keys = {
      {
        "<leader>tA",
        "<cmd>lua require('neotest').run.run({ suite = true })<cr>",
        desc = "Test Run All",
      },
      {
        "<leader>tr",
        "<cmd>lua require('neotest').run.run()<cr>",
        desc = "Test Run",
      },
      {
        "<leader>tf",
        "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>",
        desc = "Test Run File",
      },
      {
        "<leader>tn",
        "<cmd>lua require('neotest').run.run()<cr>",
        desc = "Test Nearest",
      },
      {
        "<leader>tl",
        "<cmd>lua require('neotest').run.run_last()<cr>",
        desc = "Test Last",
      },
      {
        "<leader>tL",
        "<cmd>lua require('neotest').run.run_last({ strategy = 'dap' })<cr>",
        desc = "Test Debug Last",
      },
      {
        "<leader>tj",
        "<cmd>lua require('neotest').jump.next()<cr>",
        desc = "Test Jump to Next",
      },
      {
        "<leader>tk",
        "<cmd>lua require('neotest').jump.prev()<cr>",
        desc = "Test Jump to Prev",
      },
      {
        "<leader>ts",
        "<cmd>lua require('neotest').summary.toggle()<cr>",
        desc = "Test Summary",
      },
      {
        "<leader>tS",
        "<cmd>lua require('neotest').run.stop()<cr>",
        desc = "Test Stop",
      },
      {
        "<leader>td",
        "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>",
        desc = "Test Debug Nearest",
      },
      {
        "<leader>ta",
        "<cmd>lua require('neotest').run.attach()<cr>",
        desc = "Test Attach to Runner",
      },
      {
        "<leader>to",
        "<cmd>lua require('neotest').output.open({ enter = true })<cr>",
        desc = "Test Output",
      },
      {
        "<leader>tp",
        "<cmd>Neotest output-panel<cr>",
        desc = "Output Panel",
      },
      {
        "<leader>tc",
        "<cmd>lua require('neotest').output_panel.clear()<cr>",
        desc = "Clear Panel",
      },
      {
        "<leader>tw",
        "<cmd>lua require('neotest').watch.toggle()<cr>",
        desc = "Watch Test",
      },
    },
  },
}
