return function()
  local lspconfig = safe_require("lspconfig")

  if not lspconfig then
    return
  end

  local handlers = require("modules.config.lsp.handlers")

  handlers.setup()

  handlers.enable_format_on_save()

  require("modules.config.lsp.null-ls").setup()

  local servers = {
    sumneko_lua = {
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
        },
      },
    },
    tsserver = {
      settings = {},
    },
    yamlls = {
      settings = {
        yamlls = {
          yaml = {
            format = {
              enable = true,
            },
          },
        },
      },
    },
    pylsp = {
      settings = {
        python = {
          workspaceSymbols = { enabled = true },
        },

        pylsp = {
          plugins = {
            pyls_mypy = {
              enabled = true,
            },

            flake8 = {
              enabled = true,
            },

            pydocstyle = {
              enabled = false,
            },
          },
        },
      },
    },
    texlab = {
      settings = {
        texlab = {
          chktex = {
            onEdit = true,
          },
        },
      },
    },
    clangd = {
      settings = {},
    },
    html = {
      settings = {},
    },
    tailwind = {
      settings = {},
    },
    eslint = {
      settings = {},
    },
    jsonls = {
      settings = {},
    },
  }

  require("nvim-lsp-installer").on_server_ready(function(server)
    local config = servers[server.name] or {}
    config.capabilities = handlers.capabilities
    config.on_attach = handlers.on_attach
    server:setup(config)
  end)
end
