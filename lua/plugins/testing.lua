return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/neotest-python",
      "haydenmeade/neotest-jest",
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
    },
    config = function()
      local neotest = require("neotest")
      local neotest_python = require("neotest-python")
      local neotest_jest = require("neotest-jest")

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
    end,
  },
}
