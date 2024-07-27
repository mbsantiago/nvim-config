return {
  {
    "folke/trouble.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {},
    lazy = true,
    event = "LspAttach",
    cmd = "TroubleToggle",
    keys = {
      {
        "<leader>lt",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Document Diagnostics",
      },
      {
        "<leader>lw",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Workspace Diagnostics",
      },
    },
  },
}
