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
        zsh = { "beautysh" },
        bibtex = { "bibtex-tidy" },
        latex = { "latexindent" },
        groovy = { "npm-groovy-lint" },
        typescript = { "prettierd" },
        javascript = { "prettierd" },
        python = { "ruff_format", "ruff_organize_imports" },
        lua = { "stylua" },
        quarto = { "injected" },
        yaml = { "prettierd" },
        nix = { "alejandra" },
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
      {
        "<leader>lf",
        "<cmd>lua require('conform').format()<CR>",
        desc = "Format Selection",
        mode = "v",
      },
    },
  },
}
