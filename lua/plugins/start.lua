return {
  { -- Start
    "goolord/alpha-nvim",
    lazy = false,
    config = function()
      local dashboard = require("alpha.themes.dashboard")
      require("alpha").setup(dashboard.config)
    end,
    keys = {
      { "<leader>a", "<cmd>Alpha<cr>", desc = "Alpha" },
    },
  },
}
