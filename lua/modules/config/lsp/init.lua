return function()
  local lspconfig = safe_require("lspconfig")

  if not lspconfig then
    return
  end

  local handlers = require("modules.config.lsp.handlers")

  handlers.setup()

  -- handlers.enable_format_on_save()

  require("modules.config.lsp.null-ls").setup()

  local ltex = require("modules.config.lsp.ltex")

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
            pylint = {
              enabled = false,
            },

            pyls_mypy = {
              enabled = false,
            },

            flake8 = {
              enabled = false,
            },

            pydocstyle = {
              enabled = false,
            },
          },
        },
      },
    },
    ltex = ltex.default_settings(),
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

  local flags = {
    debounce_text_changes = 500,
  }

  require("nvim-lsp-installer").on_server_ready(function(server)
    local config = servers[server.name] or {}
    config.capabilities = handlers.capabilities
    config.on_attach = handlers.on_attach
    config.flags = flags
    server:setup(config)
    ltex.setup()
  end)
end
