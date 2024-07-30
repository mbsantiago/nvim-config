return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        typst = { "typstyle" },
        toml = { "taplo" },
        typescriptreact = { "prettierd", "rustywind" },
        javascriptreact = { "prettierd", "rustywind" },
        html = { "prettierd", "rustywind" },
        markdown = { "prettierd" },
        json = { "jq" },
        sh = { "shfmt" },
        bash = { "shfmt" },
        bibtex = { "bibtex-tidy" },
        latex = { "latexindent" },
        groovy = { "npm-groovy-lint" },
        typescript = { "prettierd" },
        javascript = { "prettierd" },
        python = { "ruff_format", "ruff_organize_imports", "ruff_fix" },
        lua = { "stylua" },
        ["_"] = { "trim_whitespace" },
      },
      notify_no_formatters = true,
      default_format_opts = {
        lsp_format = "fallback",
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
