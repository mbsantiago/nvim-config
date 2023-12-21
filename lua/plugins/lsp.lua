return {
  {
    "williamboman/mason.nvim",
    lazy = true,
    cmd = "Mason",
    opts = {
      PATH = "prepend",
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
      "jose-elias-alvarez/nvim-lsp-ts-utils",
      "folke/neodev.nvim",
      "folke/neoconf.nvim",
      "aznhe21/actions-preview.nvim",
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
        debounce_text_changes = 5000,
        allow_incremental_sync = true,
      }

      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        flags = flags,
        on_attach = OnAttach,
      })
      lspconfig.tsserver.setup({
        capabilities = capabilities,
        flags = flags,
        on_attach = OnAttach,
      })
      lspconfig.pyright.setup({
        capabilities = capabilities,
        flags = flags,
        on_attach = OnAttach,
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
    },
  },
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
      library = { plugins = { "neotest", "nvim-dap-ui" }, types = true },
    },
    lazy = true,
    event = "VeryLazy",
  },
  {
    "kosayoda/nvim-lightbulb",
    dependencies = {
      "neovim/nvim-lspconfig",
    },
    lazy = true,
    event = "LspAttach",
    config = function()
      require("nvim-lightbulb").setup({
        autocmd = { enabled = true },
        sign = {
          enabled = true,
        },
      })
    end,
  },
}
