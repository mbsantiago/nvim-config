return {
  lua_ls = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      completion = {
        callSnippet = "Replace",
      },
    },
  },
  tsserver = {},
  yamlls = {
    yamlls = {
      yaml = {
        format = {
          enable = true,
        },
      },
    },
  },
  pyright = {
    navic_disable = true,
  },
  pylsp = {
    cmd = { "pylsp" },
    python = {
      workspaceSymbols = { enabled = true },
    },
    pylsp = {
      plugins = {
        -- Formatting is provided by Black through null-ls
        autopep8 = { enabled = false },
        yapf = { enabled = false },
        -- Linters
        ruff = { enabled = true },
        flake8 = { enabled = false },
        pyflakes = { enabled = false },
        pylint = { enabled = false },
        pydocstyle = { enabled = false },
        pycodestyle = { enabled = false },
        mccabe = { enabled = false },
        -- Most language capabilities are provided by pyright
        jedi_hover = { enabled = false },
        jedi_definition = { enabled = false },
        jedi_symbols = { enabled = false },
        jedi_references = { enabled = false },
        jedi_signature_help = { enabled = false },
        -- Jedi completion is better though
        jedi_completion = { enabled = true, fuzzy = true },
        rope_autoimport = { enabled = true, memory = true },
        -- Rope completion is not as good as Jedi
        rope_completion = { enabled = false },
        -- Type checking is provided by pyright
        pyls_mypy = { enabled = false },
      },
    },
  },
  texlab = {
    texlab = {
      chktex = {
        onEdit = true,
      },
    },
  },
  astro = {},
  clangd = {},
  html = {},
  jsonls = {},
  taplo = {},
}
