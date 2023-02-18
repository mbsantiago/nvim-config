return {
  { -- Start
    "goolord/alpha-nvim",
    config = function()
      local dashboard = require("alpha.themes.dashboard")
      require("alpha").setup(dashboard.config)
    end,
  },
}
