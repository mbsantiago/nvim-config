local M = {}

M.setup = function()
  local null_ls = safe_require("null-ls")

  local helpers = safe_require("null-ls.helpers")

  local methods = safe_require("null-ls.methods")

  if not null_ls or not helpers or not methods then
    return
  end

  local format = null_ls.builtins.formatting

  local diagnostic = null_ls.builtins.diagnostics

  local actions = null_ls.builtins.code_actions

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
      }),
      to_stdin = true,
    },
    factory = helpers.formatter_factory,
  })

  null_ls.setup({
    sources = {
      diagnostic.eslint,
      format.prettierd,
      format.stylua,
      diagnostic.vale.with({
        command = "/home/linuxbrew/.linuxbrew/bin/vale",
      }),
      diagnostic.proselint,
      actions.proselint,
      diagnostic.write_good,
      format.prettier,
      format.isort,
      format.black,
      format.latexindent,
      stylermd,
    },
  })
end

return M
