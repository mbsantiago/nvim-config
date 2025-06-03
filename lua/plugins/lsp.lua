return {
  {
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "aznhe21/actions-preview.nvim",
      "b0o/schemastore.nvim",
      "jhofscheier/ltex-utils.nvim",
    },
    config = function()
      vim.diagnostic.config({
        virtual_lines = {
          current_line = true,
        },
      })

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

      -- Configure LSPs
      vim.lsp.enable("lua_ls")
      vim.lsp.config("lua_ls", {
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

      vim.lsp.enable("ts_ls")
      vim.lsp.config("ts_ls", {
        capabilities = capabilities,
        flags = {
          debounce_text_changes = 500,
        },
      })

      vim.lsp.enable("esline")
      vim.lsp.config("eslint", {
        capabilities = capabilities,
      })

      vim.lsp.enable("ty")
      vim.lsp.config("ty", {
        capabilities = capabilities,
      })

      vim.lsp.enable("tailwindcss")
      vim.lsp.config("tailwindcss", {
        capabilities = capabilities,
      })

      vim.lsp.enable("tinymist")
      vim.lsp.config("tinymist", {
        capabilities = capabilities,
        single_file_support = true,
        root_dir = function()
          return vim.fn.getcwd()
        end,
        settings = {
          exportPdf = "onType",
        },
      })

      vim.lsp.enable("cssls")
      vim.lsp.config("cssls", {
        capabilities = capabilities,
      })

      vim.lsp.enable("pyright")
      vim.lsp.config("pyright", {
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

      vim.lsp.enable("ruff")
      vim.lsp.config("ruff", {
        capabilities = capabilities,
      })

      vim.lsp.enable("taplo")
      vim.lsp.config("taplo", {
        capabilities = capabilities,
      })

      vim.lsp.enable("jsonls")
      vim.lsp.config("jsonls", {
        capabilities = capabilities,
        settings = {
          json = {
            schemas = require("schemastore").json.schemas(),
            validate = { enable = true },
          },
        },
      })

      vim.lsp.enable("yamlls")
      vim.lsp.config("yamlls", {
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

      vim.lsp.enable("docker_compose_language_service")
      vim.lsp.config("docker_compose_language_service", {
        capabilities = capabilities,
      })

      vim.lsp.enable("bashls")
      vim.lsp.config("bashls", {
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

      vim.lsp.enable("rust_analyzer")
      vim.lsp.config("rust_analyzer", {
        capabilities = capabilities,
      })

      vim.lsp.enable("texlab")
      vim.lsp.config("texlab", {
        capabilities = capabilities,
      })

      vim.lsp.enable("markdown_oxide")
      vim.lsp.config("markdown_oxide", {
        capabilities = capabilities,
      })

      vim.lsp.enable("hyprls")
      vim.lsp.config("hyprls", {
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
}
