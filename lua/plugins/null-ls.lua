return {
  {
    "jay-babu/mason-null-ls.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "nvimtools/none-ls.nvim",
    },
    config = function()
      require("mason-null-ls").setup({
        ensure_installed = {
          "black",
          "prettier",
          "ruff",
          "eslint_d",
        },
        handlers = {}
      })
      require("null-ls").setup({
        debounce = 2000,
      })
    end,
    lazy = true,
    event = "VeryLazy",
    keys = {
      {
        "<leader>lf",
        vim.lsp.buf.format,
        desc = "Format",
      },
    },
  },
}
