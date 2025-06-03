return {
  {
    "olimorris/codecompanion.nvim",
    config = function()
      require("codecompanion").setup({
        strategies = {
          chat = {
            adapter = "gemini",
          },
          inline = {
            adapter = "gemini",
          },
        },
      })
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    keys = {
      {
        "<leader>ac",
        "<cmd>CodeCompanionChat Toggle<cr>",
        desc = "Toggle Code Companion Chat",
      },
      {
        "<leader>aa",
        "<cmd>CodeCompanionActions <cr>",
        desc = "Toggle Code Companion Actions",
      },
      {
        "<leader>a",
        ":CodeCompanion ",
        mode = { "v" },
        desc = "Toggle Code Companion Chat",
      },
    },
  },
}
