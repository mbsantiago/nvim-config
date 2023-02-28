return {
  {
    "phaazon/hop.nvim",
    config = true,
    cmd = "Hop",
    lazy = true,
    keys = {
      { "<leader>hw", "<cmd>HopWord<cr>", desc = "Hop to Word" },
      {
        "<leader>hp",
        "<cmd>HopPattern<cr>",
        desc = "Hop to Pattern",
      },
      { "<leader>hl", "<cmd>HopLine<cr>", desc = "Hop to Line" },
      {
        "<leader>hL",
        "<cmd>HopLineStart<cr>",
        desc = "Hop to Line Start",
      },
      {
        "<leader>hc",
        "<cmd>HopChar1<cr>",
        desc = "Hop to Character",
      },
      {
        "<leader>hC",
        "<cmd>HopChar2<cr>",
        desc = "Hop to Characters [2]",
      },
      {
        "<leader>ha",
        "<cmd>HopAnywhere<cr>",
        desc = "Hop Anywhere",
      },
    },
  },
}
