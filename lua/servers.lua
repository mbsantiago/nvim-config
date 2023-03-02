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
  pylsp = {
    cmd = { "pylsp" },
    python = {
      workspaceSymbols = { enabled = true },
    },
    pylsp = {
      plugins = {
        autopep8 = { enabled = false },
        yapf = { enabled = false },
        pylint = { enabled = false },
        flake8 = { enabled = true },
        pydocstyle = { enabled = false },
        pycodestyle = { enabled = false },
        mccabe = { enabled = false },
        rope_autoimport = { enabled = false },
        rope_completion = { enabled = true },
        pyls_mypy = { enabled = false },
      },
    },
  },
  pyright = {
    navic_disable = true,
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
