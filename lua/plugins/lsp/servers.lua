local M = {}

M.servers = function()
  local ltex = require("plugins.lsp.ltex")

  local servers = {
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
    ltex = ltex.default_settings()["settings"],
    texlab = {
      texlab = {
        chktex = {
          onEdit = true,
        },
      },
    },
    clangd = {},
    html = {},
    jsonls = {},
    taplo = {},
  }

  return servers
end

return M
