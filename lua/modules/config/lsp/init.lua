return function()
  -- Setup mason first
  local mason = safe_require("mason")

  if not mason then
    return
  end

  mason.setup({
    PATH = "append",
  })

  -- Integrate mason with lsp_config

  local mason_lspconfig = safe_require("mason-lspconfig")

  if not mason_lspconfig then
    return
  end

  mason_lspconfig.setup({})

  -- Configure servers
  local lspconfig = safe_require("lspconfig")

  if not lspconfig then
    return
  end

  local handlers = require("modules.config.lsp.handlers")

  handlers.setup()

  local servers = require("modules.config.lsp.servers").servers()

  local flags = {
    debounce_text_changes = 600,
  }

  for k, v in pairs(servers) do
    lspconfig[k].setup({
      on_attach = handlers.on_attach,
      capabilities = handlers.capabilities,
      flags = flags,
      settings = v,
    })
  end

  -- local config = servers[server.name] or {}
  -- config.capabilities = handlers.capabilities
  -- config.on_attach = handlers.on_attach
  -- config.flags = flags
  -- server:setup(config)
  -- ltex.setup()

  -- Null-ls

  require("modules.config.lsp.null-ls").setup()

  -- Figdet LSP progress

  local fidget = safe_require("fidget")

  if not fidget then
    return
  end

  fidget.setup({})
end
