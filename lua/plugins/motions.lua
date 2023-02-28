return {
  {
    "phaazon/hop.nvim",
    config = true,
    cmd = "Hop",
    lazy = true,
    keys = {
      { "<leader>mw", "<cmd>HopWord<cr>", desc = "To Word" },
      {
        "<leader>mp",
        "<cmd>HopPattern<cr>",
        desc = "To Pattern",
      },
      { "<leader>ml", "<cmd>HopLine<cr>", desc = "To Line" },
      {
        "<leader>mL",
        "<cmd>HopLineStart<cr>",
        desc = "To Line Start",
      },
      {
        "<leader>mc",
        "<cmd>HopChar1<cr>",
        desc = "To Character",
      },
      {
        "<leader>mC",
        "<cmd>HopChar2<cr>",
        desc = "To Characters [2]",
      },
      {
        "<leader>ma",
        "<cmd>HopAnywhere<cr>",
        desc = "To Anywhere",
      },
    },
  },
}
