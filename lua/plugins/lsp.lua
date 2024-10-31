local function get_typst_root_path(path)
  local root_patterns = { ".git", "main.typ" }

  -- Check if path is in a git repository
  local root_dir =
    vim.fs.dirname(vim.fs.find(root_patterns, { upward = true })[1])

  -- If not return the original path parent
  if root_dir == nil then
    return vim.fn.fnamemodify(path, ":h")
  end

  -- Otherwise return the git repository root
  return root_dir
end

return {
  {
    "williamboman/mason.nvim",
    lazy = true,
    cmd = "Mason",
    opts = {
      PATH = "prepend",
      ui = {
        border = "rounded",
      },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
    },
    config = true,
    lazy = true,
    event = "VeryLazy",
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "aznhe21/actions-preview.nvim",
      "b0o/schemastore.nvim",
    },
    config = function()
      -- Setup capabilities (completion and snippets)
      local capabilities = vim.tbl_deep_extend(
        "force",
        {
          textDocument = {
            foldingRange = {
              dynamicRegistration = false,
              lineFoldingOnly = true,
            },
          },
        },
        vim.lsp.protocol.make_client_capabilities(),
        require("cmp_nvim_lsp").default_capabilities()
      )

      local lspconfig = require("lspconfig")

      -- Configure LSPs
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        settings = {
          Lua = {
            format = {
              enable = false,
            },
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
      })
      lspconfig.ts_ls.setup({
        capabilities = capabilities,
        flags = {
          debounce_text_changes = 500,
        },
      })
      lspconfig.eslint.setup({
        capabilities = capabilities,
      })
      lspconfig.tailwindcss.setup({
        capabilities = capabilities,
      })
      lspconfig.tinymist.setup({
        capabilities = capabilities,
        single_file_support = true,
        root_dir = function()
          return vim.fn.getcwd()
        end,
        settings = {
          exportPdf = "onType",
        },
      })
      lspconfig.cssls.setup({
        capabilities = capabilities,
      })
      lspconfig.pyright.setup({
        autostart = true,
        capabilities = capabilities,
        settings = {
          disableLanguageServices = true,
          disableOrganizeImports = true,
          python = {
            analysis = {
              diagnosticMode = "workspace",
            },
          },
        },
      })
      lspconfig.ruff.setup({
        capabilities = capabilities,
      })
      lspconfig.groovyls.setup({
        capabilities = capabilities,
        cmd = { "groovy-language-server" },
        root_dir = function(_)
          return vim.fn.getcwd()
        end,
      })
      lspconfig.taplo.setup({
        capabilities = capabilities,
      })
      lspconfig.jsonls.setup({
        capabilities = capabilities,
        settings = {
          json = {
            schemas = require("schemastore").json.schemas(),
            validate = { enable = true },
          },
        },
      })
      lspconfig.yamlls.setup({
        capabilities = capabilities,
        settings = {
          yaml = {
            schemaStore = {
              enable = false,
              url = "",
            },
            schemas = require("schemastore").yaml.schemas(),
          },
        },
      })
      lspconfig.astro.setup({
        capabilities = capabilities,
      })
      lspconfig.docker_compose_language_service.setup({
        capabilities = capabilities,
      })
      lspconfig.bashls.setup({
        capabilities = capabilities,
        filetypes = { "sh", "bash" },
        settings = {
          bashIde = {
            shfmt = {
              binaryNextLine = true,
              caseIndent = true,
              funcNextLine = true,
              ignoreEditorconfig = false,
              keepPadding = true,
              languageDialect = "auto",
              path = "shfmt",
              simplifyCode = true,
              spaceRedirects = true,
            },
          },
        },
      })
      lspconfig.texlab.setup({
        capabilities = capabilities,
      })
      lspconfig.markdown_oxide.setup({
        capabilities = capabilities,
      })
      lspconfig.hyprls.setup({
        capabilities = capabilities,
      })
    end,
    keys = {
      {
        "<leader>ls",
        vim.lsp.buf.signature_help,
        desc = "Signature help",
      },
      {
        "<leader>la",
        function()
          require("actions-preview").code_actions()
        end,
        desc = "Code Action",
      },
      {
        "<leader>lr",
        vim.lsp.buf.rename,
        desc = "Rename",
      },
      {
        "<leader>lF",
        vim.lsp.buf.references,
        desc = "Finder",
      },
      {
        "<leader>ld",
        vim.lsp.buf.definition,
        desc = "Go To Definition",
      },
      {
        "<leader>lD",
        vim.lsp.buf.declaration,
        desc = "Go To Declaration",
      },
      { "<leader>lh", vim.lsp.buf.hover, desc = "Hover Docs" },
      {
        "<leader>lj",
        vim.diagnostic.goto_next,
        desc = "Next Diagnostic",
      },
      {
        "<leader>lk",
        vim.diagnostic.goto_prev,
        desc = "Prev Diagnostic",
      },
      {
        "<leader>wP",
        function()
          vim.lsp.buf.execute_command({
            command = "tinymist.pinMain",
            arguments = { vim.api.nvim_buf_get_name(0) },
          })
        end,
        desc = "Pin Main",
      },
    },
  },
  {
    "simrat39/rust-tools.nvim",
    config = true,
    lazy = true,
    ft = "rust",
  },
}
