local M = {}

M.setup = function()
  local mason_null_ls = safe_require("mason-null-ls")

  local null_ls = safe_require("null-ls")

  local helpers = safe_require("null-ls.helpers")

  local methods = safe_require("null-ls.methods")

  if not null_ls or not helpers or not methods or not mason_null_ls then
    return
  end

  local format = null_ls.builtins.formatting

  local diagnostic = null_ls.builtins.diagnostics

  local actions = null_ls.builtins.code_actions

  -- Make formater for R markdown
  local stylermd = helpers.make_builtin({
    name = "stylermd",
    method = { methods.internal.FORMATTING },
    filetypes = { "rmd" },
    generator_opts = {
      command = "R",
      args = helpers.range_formatting_args_factory({
        "--slave",
        "--no-restore",
        "--no-save",
        "-e",
        [[
        options(styler.quiet = TRUE)
        con <- file("stdin")
        temp <- tempfile("styler", fileext = ".Rmd")
        writeLines(readLines(con), temp)
        styler::style_file(temp)
        output <- paste0(readLines(temp), collapse = '\n')
        cat(output)
        close(con)
      ]],
      }, "stylermd"),
      to_stdin = true,
    },
    factory = helpers.formatter_factory,
  })

  null_ls.setup({
    debug = true,
    sources = {
      -- Diagnostics
      diagnostic.proselint,
      diagnostic.write_good,
      -- diagnostic.vale.with({
      --   command = "/home/linuxbrew/.linuxbrew/bin/vale",
      -- }),
      -- Formatting
      format.isort,
      format.black,
      format.latexindent,
      format.djhtml,
      format.fish_indent,
      format.shfmt,
      format.stylua,
      format.rustfmt,
      format.prettier.with({
        filetypes = {
          "javascript",
          "javascriptreact",
          "typescript",
          "typescriptreact",
          "vue",
          "css",
          "scss",
          "less",
          "html",
          "json",
          "yaml",
          "markdown",
          "graphql",
          "pandoc",
        },
        command = "/usr/local/bin/prettier",
      }),
      -- Actions
      actions.proselint,
      stylermd,
    },
  })

  mason_null_ls.setup({
    ensure_installed = nil,
    automatic_installation = true,
    automatic_setup = true,
  })
end

return M
