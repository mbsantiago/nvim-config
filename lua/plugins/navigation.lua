return {
  {
    "enddeadroyal/symbols-outline.nvim",
    lazy = true,
    opts = {
      autofold_depth = 2,
      auto_unfold_hover = true,
    },
    branch = "bugfix/symbol-hover-misplacement",
    cmd = "SymbolsOutline",
    keys = {
      {
        "<leader>lo",
        "<cmd>SymbolsOutline<cr>",
        desc = "Symbols Outline",
      },
    },
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      {
        "<leader>j",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash",
      },
      {
        "<leader>J",
        mode = { "n", "x", "o" },
        function()
          require("flash").treesitter()
        end,
        desc = "Flash Treesitter",
      },
      {
        "<leader>j",
        mode = "o",
        function()
          require("flash").remote()
        end,
        desc = "Remote Flash",
      },
      {
        "<leader>J",
        mode = { "o", "x" },
        function()
          require("flash").treesitter_search()
        end,
        desc = "Treesitter Search",
      },
      {
        "<c-s>",
        mode = { "c" },
        function()
          require("flash").toggle()
        end,
        desc = "Toggle Flash Search",
      },
    },
  },
}
