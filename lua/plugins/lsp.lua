return {
  {
    "folke/neoconf.nvim",
    opts = {
      plugins = {
        jsonls = {
          enabled = true,
          configured_servers_only = true,
        },
        lua_ls = {
          enabled = true,
        },
      },
    },
    lazy = true,
    event = "VeryLazy",
    keys = {
      {
        "<leader>le",
        "<cmd>Neoconf global<cr>",
        desc = "Setup LSP",
      },
      {
        "<leader>lC",
        "<cmd>Neoconf lsp<cr>",
        desc = "LSP Configs",
      },
      {
        "<leader>li",
        "<cmd>LspInfo<cr>",
        desc = "LSP Info",
      },
    },
  },
  {
    "folke/neodev.nvim",
    opts = {
      library = { plugins = { "neotest", "nvimd-dap-ui" }, types = true },
    },
    lazy = true,
    event = "VeryLazy",
  },
  {
    "williamboman/mason.nvim",
    lazy = true,
    cmd = "Mason",
    opts = {
      PATH = "prepend",
      ui = {
        border = "single",
      },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "jose-elias-alvarez/nvim-lsp-ts-utils",
      "tjdevries/lsp_extensions.nvim",
      "williamboman/mason.nvim",
      "folke/neoconf.nvim",
      "folke/neodev.nvim",
    },
    keys = {
      {
        "<leader>ls",
        "<cmd>lua vim.lsp.buf.signature_help()<cr>",
        desc = "Signature help",
      },
    },
    config = function()
      local cmp_nvim_lsp = require("cmp_nvim_lsp")
      local ts_utils = require("nvim-lsp-ts-utils")

      -- Setup client capabilities
      local capabilities = vim.lsp.protocol.make_client_capabilities()

      -- Enable snippets
      capabilities.textDocument.completion.completionItem.snippetSupport = true
      capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

      -- Enable folding
      capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true,
      }

      -- On attach functions
      local function OnAttach(client, _)
        -- Setup TypeScript utils if client is tsserver
        if client.name == "tsserver" then
          ts_utils.setup({})
          ts_utils.setup_client(client)
        end
      end

      local flags = {
        debounce_text_changes = 2000,
      }

      local neoconf = require("neoconf")
      local enabled = neoconf.get("enabled", {})
      require("mason-lspconfig").setup()
      require("mason-lspconfig").setup_handlers({
        function(server_name)
          if enabled[server_name] == false then
            return
          end
          require("lspconfig")[server_name].setup({
            on_attach = OnAttach,
            capabilities = capabilities,
            flags = flags,
          })
        end,
        ltex = function()
          require("lspconfig")["ltex"].setup({
            filetypes = { "tex", "bib" },
            on_attach = OnAttach,
            capabilities = capabilities,
            flags = flags,
          })
        end,
      })

      -- Setup gutter signs
      local signs =
      { Error = " ", Warn = " ", Hint = " ", Info = " " }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end

      -- vim.diagnostic.config({
      --   virtual_text = {
      --     prefix = "▎",
      --   },
      --   severity_sort = true,
      -- })
    end,
    lazy = true,
    event = "VeryLazy",
  },
  {
    "glepnir/lspsaga.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("lspsaga").setup({
        code_action = {
          show_server_name = true,
          extend_gitsigns = true,
        },
        outline = {
          auto_preview = true,
          auto_close = true,
          close_after_jump = true,
        },
        symbol_in_winbar = {
          enable = true,
        },
        ui = {
          title = true,
          border = "rounded",
          lines = { "└", "├", "│", "─", "┌" },
          actionfix = " ",
          code_action = "💡",
          imp_sign = "󰳛 ",
        },
        light_bulb = {
          debouce = 200,
        },
        hover = {
          max_width = 0.8,
        },
      })
    end,
    event = "LspAttach",
    keys = {
      { "<leader>la", "<cmd>Lspsaga code_action<cr>", desc = "Code Action" },
      { "<leader>lr", "<cmd>Lspsaga rename<cr>",      desc = "Rename" },
      {
        "<leader>lR",
        "<cmd>Lspsaga rename ++project<cr>",
        desc = "Rename Project",
      },
      { "<leader>lF", "<cmd>Lspsaga finder<cr>",    desc = "Finder" },
      {
        "<leader>ld",
        "<cmd>Lspsaga goto_definition<cr>",
        desc = "Go To Definition",
      },
      {
        "<leader>lp",
        "<cmd>Lspsaga peek_definition<cr>",
        desc = "Peek Definition",
      },
      { "<leader>lh", "<cmd>Lspsaga hover_doc<cr>", desc = "Hover Docs" },
      {
        "<leader>lj",
        "<cmd>Lspsaga diagnostic_jump_next<CR>",
        desc = "Next Diagnostic",
      },
      {
        "<leader>lk",
        "<cmd>Lspsaga diagnostic_jump_prev<cr>",
        desc = "Prev Diagnostic",
      },
      {
        "<leader>lc",
        "<cmd>Lspsaga show_cursor_diagnostics<cr>",
        desc = "Show Cursor Diagnostics",
      },
      {
        "<leader>lL",
        "<cmd>Lspsaga show_line_diagnostics<cr>",
        desc = "Show Line Diagnostics",
      },
    },
  },
  {
    "jay-babu/mason-null-ls.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "folke/neoconf.nvim",
    },
    config = function()
      local neoconf = require("neoconf")
      local enabled = neoconf.get("enabled", {})
      local null_ls = require("null-ls")

      require("mason-null-ls").setup({
        handlers = {
          function(source_name, methods)
            if enabled[source_name] == false then
              return
            end
            require("mason-null-ls").default_setup(source_name, methods)
          end,
          ---@diagnostic disable-next-line: unused-local
          ["pydocstyle"] = function(source_name, methods)
            null_ls.register(null_ls.builtins.diagnostics.pydocstyle.with({
              extra_args = { "--config=$ROOT/setup.cfg" },
            }))
          end,
        },
        ensure_installed = nil,
        automatic_installation = false,
        automatic_setup = true,
      })
    end,
    lazy = true,
    event = "VeryLazy",
  },
  {
    "nvimtools/none-ls.nvim",
    dependencies = {
      "jay-babu/mason-null-ls.nvim",
      "neovim/nvim-lspconfig",
    },
    lazy = true,
    keys = {
      {
        "<leader>lf",
        "<cmd>lua vim.lsp.buf.format({ async = true })<cr>",
        desc = "Format",
      },
    },
    config = function()
      require("null-ls").setup({
        debounce = 1000,
        update_in_insert = false,
      })
    end,
  },
  {
    "folke/trouble.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      icons = true,
      signs = {
        error = "",
        warning = "",
        hint = "",
        information = "",
        other = "﫠",
      },
    },
    lazy = true,
    event = "LspAttach",
    cmd = "TroubleToggle",
    keys = {
      {
        "<leader>lt",
        "<cmd>TroubleToggle document_diagnostics<cr>",
        desc = "Document Diagnostics",
      },
      {
        "<leader>lw",
        "<cmd>TroubleToggle workspace_diagnostics<cr>",
        desc = "Workspace Diagnostics",
      },
    },
  },
  {
    "enddeadroyal/symbols-outline.nvim",
    lazy = true,
    opts = {
      autofold_depth = 2,
      auto_unfold_hover = true,
    },
    branch = "bugfix/symbol-hover-misplacement",
    cmd = "SymbolsOutline",
    keys = {
      {
        "<leader>lo",
        "<cmd>SymbolsOutline<cr>",
        desc = "Symbols Outline",
      },
    },
  },
}
