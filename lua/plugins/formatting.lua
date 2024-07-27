return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        sh = { "shfmt" },
        bash = { "shfmt" },
        bibtex = { "bibtex-tidy" },
        latex = { "latexindent" },
        groovy = { "npm-groovy-lint" },
        typescript = { "prettierd" },
        javascript = { "prettierd" },
        python = { "ruff", lsp_format = "fallback" },
        lua = { "stylua" },
      },
    },
    lazy = true,
    event = "VeryLazy",
    keys = {
      {
        "<leader>lf",
        "<cmd>lua require('conform').format()<CR>",
        desc = "Format",
      },
    },
  },
}
