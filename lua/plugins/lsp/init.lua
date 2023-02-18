return {
  {
    "williamboman/mason.nvim",
    opts = {
      PATH = "append",
    },
  },
  {
    "tami5/lspsaga.nvim",
    config = function()
      require("lspsaga").init_lsp_saga()
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "tjdevries/lsp_extensions.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "jose-elias-alvarez/nvim-lsp-ts-utils",
    },
    config = function()
      local lspconfig = require("lspconfig")
      local cmp_nvim_lsp = require("cmp_nvim_lsp")
      local ts_utils = require("nvim-lsp-ts-utils")

      -- Load server config from local file
      local servers = require("plugins.lsp.servers").servers()

      -- Setup client capabilities
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true
      capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

      -- On attach functions
      function on_attach(client, bufnr)
        if client.name ~= "null-ls" then
          client.server_capabilities.document_formatting = false
        end

        if client.name == "tsserver" then
          ts_utils.setup({})
          ts_utils.setup_client(client)
        end
      end

      -- Setup all servers
      for k, v in pairs(servers) do
        lspconfig[k].setup({
          on_attach = on_attach,
          capabilities = capabilities,
          flags = flags,
          settings = v,
        })
      end
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    config = true,
  },
  {
    "j-hui/fidget.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
    },
    config = true,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
    },
    config = function()
      local null_ls = require("null-ls")
      local helpers = require("null-ls.helpers")
      local methods = require("null-ls.methods")

      local format = null_ls.builtins.formatting
      local diagnostic = null_ls.builtins.diagnostics
      local actions = null_ls.builtins.code_actions

      -- Make formater for R markdown
      local stylermd = helpers.make_builtin({
        name = "stylermd",
        method = { methods.internal.FORMATTING },
        filetypes = { "rmd" },
        generator_opts = {
          command = "R",
          args = helpers.range_formatting_args_factory({
            "--slave",
            "--no-restore",
            "--no-save",
            "-e",
            [[
            options(styler.quiet = TRUE)
            con <- file("stdin")
            temp <- tempfile("styler", fileext = ".Rmd")
            writeLines(readLines(con), temp)
            styler::style_file(temp)
            output <- paste0(readLines(temp), collapse = '\n')
            cat(output)
            close(con)
          ]],
          }, "stylermd"),
          to_stdin = true,
        },
        factory = helpers.formatter_factory,
      })

      null_ls.setup({
        debug = true,
        sources = {
          -- Diagnostics
          diagnostic.proselint,
          diagnostic.write_good,
          -- diagnostic.vale.with({
          --   command = "/home/linuxbrew/.linuxbrew/bin/vale",
          -- }),
          -- Formatting
          format.isort,
          format.black,
          format.latexindent,
          format.djhtml,
          format.fish_indent,
          format.shfmt,
          format.stylua,
          format.rustfmt,
          format.prettier.with({
            filetypes = {
              "javascript",
              "javascriptreact",
              "typescript",
              "typescriptreact",
              "vue",
              "css",
              "scss",
              "less",
              "html",
              "json",
              "yaml",
              "markdown",
              "graphql",
              "pandoc",
            },
            command = "/usr/local/bin/prettier",
          }),
          -- Actions
          actions.proselint,
          stylermd,
        },
      })
    end,
  },
  {
    "jayp0521/mason-null-ls.nvim",
    dependencies = {
      "jose-elias-alvarez/null-ls.nvim",
      "williamboman/mason.nvim",
    },
    opts = {
      ensure_installed = nil,
      automatic_installation = true,
      automatic_setup = true,
    },
  },
  {
    "folke/trouble.nvim",
    config = true,
    dependencies = {
      "neovim/nvim-lspconfig",
      "nvim-tree/nvim-web-devicons",
    },
    keys = {
      {
        "<leader>xx",
        "<cmd>TroubleToggle<cr>",
        desc = "Trouble Toggle",
      },
      {
        "<leader>xw",
        "<cmd>TroubleToggle lsp_workspace_diagnostics<cr>",
        desc = "Trouble Workspace Diagnostics",
      },
      {
        "<leader>xd",
        "<cmd>TroubleToggle lsp_document_diagnostics<cr>",
        desc = "Trouble Document Diagnostics",
      },
      {
        "<leader>xl",
        "<cmd>TroubleToggle loclist<cr>",
        desc = "Trouble Location List",
      },
      {
        "<leader>xq",
        "<cmd>TroubleToggle quickfix<cr>",
        desc = "Trouble Quickfix List",
      },
      {
        "<leader>xr",
        "<cmd>TroubleToggle lsp_references<cr>",
        desc = "Trouble LSP References",
      },
    },
  },
}
