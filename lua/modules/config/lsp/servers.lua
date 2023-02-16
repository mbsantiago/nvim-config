local M = {}

M.servers = function()
  local ltex = require("modules.config.lsp.ltex")
  local servers = {
    sumneko_lua = {
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
    -- pyright = {},
    pylsp = {
      cmd = { "pylsp" },
      python = {
        workspaceSymbols = { enabled = true },
      },
      pylsp = {
        plugins = {
          autopep8 = { enabled = false },
          yapf = { enabled = false },
          pylint = { enabled = true },
          pyls_mypy = { enabled = true },
          flake8 = { enabled = false },
          pydocstyle = { enabled = false },
          pycodestyle = { enabled = false },
          mccabe = { enabled = false },
          rope_autoimport = { enabled = true },
          rope_completion = { enabled = true },
        },
      },
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
