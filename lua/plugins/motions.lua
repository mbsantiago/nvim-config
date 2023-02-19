return {
  {
    "phaazon/hop.nvim",
    config = true,
    cmd = "Hop",
    lazy = true,
    keys = {
      { "n", "<leader><leader>w", "<cmd>HopWord<cr>", desc = "Hop to Word" },
      {
        "n",
        "<leader><leader>p",
        "<cmd>HopPattern<cr>",
        desc = "Hop to Pattern",
      },
      { "n", "<leader><leader>l", "<cmd>HopLine<cr>", desc = "Hop to Line" },
      {
        "n",
        "<leader><leader>L",
        "<cmd>HopLineStart<cr>",
        desc = "Hop to Line Start",
      },
      {
        "n",
        "<leader><leader>c",
        "<cmd>HopChar1<cr>",
        desc = "Hop to Character",
      },
      {
        "n",
        "<leader><leader>C",
        "<cmd>HopChar2<cr>",
        desc = "Hop to Characters [2]",
      },
      {
        "n",
        "<leader><leader>a",
        "<cmd>HopAnywhere<cr>",
        desc = "Hop Anywhere",
      },
    },
  },
}
