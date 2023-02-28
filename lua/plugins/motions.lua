return {
  {
    "phaazon/hop.nvim",
    config = true,
    cmd = "Hop",
    lazy = true,
    keys = {
      { "<leader>jw", "<cmd>HopWord<cr>", desc = "To Word" },
      {
        "<leader>jp",
        "<cmd>HopPattern<cr>",
        desc = "To Pattern",
      },
      { "<leader>jl", "<cmd>HopLine<cr>", desc = "To Line" },
      {
        "<leader>jL",
        "<cmd>HopLineStart<cr>",
        desc = "To Line Start",
      },
      {
        "<leader>jc",
        "<cmd>HopChar1<cr>",
        desc = "To Character",
      },
      {
        "<leader>jC",
        "<cmd>HopChar2<cr>",
        desc = "To Characters [2]",
      },
      {
        "<leader>ja",
        "<cmd>HopAnywhere<cr>",
        desc = "To Anywhere",
      },
    },
  },
  {
    "mfussenegger/nvim-treehopper",
    lazy = true,
    dependencies = {
      { "phaazon/hop.nvim" },
    },
    keys = {
      {
        "<leader>js",
        "<cmd>lua require('tsht').move({ side = 'start' })<cr>",
        desc = "To Start of Node",
      },
      {
        "<leader>je",
        "<cmd>lua require('tsht').move({ side = 'end' })<cr>",
        desc = "To End of Node",
      },
      {
        "<leader>sn",
        "<cmd>lua require('tsht').nodes()<cr>",
        desc = "To Node",
      },
    },
  }
}
