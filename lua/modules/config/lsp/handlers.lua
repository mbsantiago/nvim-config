local M = {}

M.setup = function()
  local saga = safe_require("lspsaga")

  if saga then
    saga.init_lsp_saga({
      border_style = "round",
    })
  end
end

function M.on_attach(client, bufnr)
  local lsp_signature = safe_require("lsp_signature")

  if lsp_signature then
    lsp_signature.on_attach()
  end

  if client.name ~= "null-ls" then
    client.resolved_capabilities.document_formatting = false
  end

  if client.name == "tsserver" then
    local ts_utils = safe_require("nvim-lsp-ts-utils")

    if ts_utils then
      ts_utils.setup({})
      ts_utils.setup_client(client)
    end
  end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.completion.completionItem.snippetSupport = true

local cmp_nvim_lsp = safe_require("cmp_nvim_lsp")

if cmp_nvim_lsp then
  capabilities = cmp_nvim_lsp.update_capabilities(capabilities)
end

M.capabilities = capabilities

function M.enable_format_on_save()
  vim.cmd([[
    augroup format_on_save
      au!
      au BufWritePre * lua vim.lsp.buf.formatting_sync(nil, 2000)
    augroup end
  ]])
end

function M.toggle_format_on_save()
  if vim.fn.exists("#format_on_save#BufWritePre") == 0 then
    M.enable_format_on_save()
    vim.notify("Enabled format on save")
  else
    vim.cmd("au! format_on_save")
    vim.notify("Disabled format on save")
  end
end

vim.cmd(
  [[command! LspToggleAutoFormat execute 'lua require("modules.config.lsp.handlers").toggle_format_on_save()']]
)

return M
