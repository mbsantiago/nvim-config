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
        markdown = { "prettierd", "mdslw" },
        json = { "jq" },
        sh = { "shfmt" },
        bash = { "shfmt" },
        zsh = { "beautysh" },
        bibtex = { "bibtex-tidy" },
        latex = { "latexindent" },
        typescript = { "prettierd" },
        javascript = { "prettierd" },
        python = { "ruff_format", "ruff_organize_imports" },
        lua = { "stylua" },
        rust = { "rustfmt" },
        jinja = { "djlint" },
        quarto = {
          "mdslw",
          "injected",
        },
        yaml = { "prettierd" },
        ["_"] = { "trim_whitespace" },
      },
      ext_parsers = {
        qmd = "markdown",
      },
      notify_no_formatters = true,
      default_format_opts = {
        lsp_format = "fallback",
      },
      formatters = {
        mdslw = {
          args = {
            "--end-markers",
            ".",
            "--max-width",
            "0",
          },
        },
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
      {
        "<leader>lf",
        "<cmd>lua require('conform').format()<CR>",
        desc = "Format Selection",
        mode = "v",
      },
    },
  },
}
