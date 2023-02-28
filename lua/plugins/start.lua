return {
  {
    "glepnir/dashboard-nvim",
    event = "VimEnter",
    config = function()
      require("dashboard").setup({
        theme = "hyper",
        config = {
          week_header = {
            enable = true,
          },
          shortcut = {
            {
              desc = " Update",
              group = "@property",
              action = "Lazy update",
              key = "u",
            },
            {
              icon = " ",
              icon_hl = "@variable",
              desc = "Files",
              group = "Label",
              action = "Telescope find_files",
              key = "f",
            },
            {
              desc = "󰺮 Find text",
              group = "DiagnosticHint",
              action = "Telescope live_grep",
              key = "t",
            },
            {
              desc = " Check health",
              group = "Number",
              action = "checkhealth",
              key = "h",
            },
            {
              desc = " Quit",
              group = "String",
              action = "qa",
              key = "q",
            },
          },
          project = { limit = 5 },
          mru = { limit = 5 },
        },
      })
    end,
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
  },
}
