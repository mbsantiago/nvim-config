return {
  {
    "numToStr/Navigator.nvim",
    config = true,
    lazy = false,
    keys = {
      {
        "<A-h>",
        "<CMD>NavigatorLeft<CR>",
        desc = "Navigate left",
        mode = { "n", "t" },
      },
      {
        "<A-j>",
        "<CMD>NavigatorDown<CR>",
        desc = "Navigate down",
        mode = { "n", "t" },
      },
      {
        "<A-k>",
        "<CMD>NavigatorUp<CR>",
        desc = "Navigate up",
        mode = { "n", "t" },
      },
      {
        "<A-l>",
        "<CMD>NavigatorRight<CR>",
        desc = "Navigate right",
        mode = { "n", "t" },
      },
      {
        "<A-p>",
        "<CMD>NavigatorPrevious<CR>",
        desc = "Navigate previous",
      },
    },
  },
}
