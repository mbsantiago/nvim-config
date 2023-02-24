return {
  {
    "phaazon/hop.nvim",
    config = true,
    cmd = "Hop",
    lazy = true,
    keys = {
      { "<leader><leader>w", "<cmd>HopWord<cr>", desc = "Hop to Word" },
      {
        "<leader><leader>p",
        "<cmd>HopPattern<cr>",
        desc = "Hop to Pattern",
      },
      { "<leader><leader>l", "<cmd>HopLine<cr>", desc = "Hop to Line" },
      {
        "<leader><leader>L",
        "<cmd>HopLineStart<cr>",
        desc = "Hop to Line Start",
      },
      {
        "<leader><leader>c",
        "<cmd>HopChar1<cr>",
        desc = "Hop to Character",
      },
      {
        "<leader><leader>C",
        "<cmd>HopChar2<cr>",
        desc = "Hop to Characters [2]",
      },
      {
        "<leader><leader>a",
        "<cmd>HopAnywhere<cr>",
        desc = "Hop Anywhere",
      },
    },
  },
}
