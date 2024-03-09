return {
  {
    "nvimtools/none-ls.nvim",
    config = function()
      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.prettierd,
          null_ls.builtins.formatting.black,
          null_ls.builtins.formatting.isort,
          null_ls.builtins.formatting.shfmt,
          null_ls.builtins.formatting.beautysh,
          null_ls.builtins.diagnostics.actionlint,
        },
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
