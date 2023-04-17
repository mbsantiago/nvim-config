return {
  {
    -- Autocompletion plugin
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-emoji",
      "hrsh7th/cmp-omni",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "hrsh7th/cmp-nvim-lsp-document-symbol",
      "tzachar/cmp-fuzzy-buffer",
      "tzachar/cmp-fuzzy-path",
      "onsails/lspkind-nvim",
    },
    config = function()
      local cmp = require("cmp")
      local compare = require("cmp.config.compare")
      local fzf_compare = require("cmp_fuzzy_buffer.compare")

      -- TODO: Check if these can be moved to their corresponding sections
      local lspkind = require("lspkind")
      local luasnip = require("luasnip")

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = {
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<C-n>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
          ["<C-p>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
        },
        -- Sources order are actually their priority order
        sources = {
          { name = "nvim_lsp_signature_help" },
          { name = "nvim_lsp", keyword_length = 2 },
          { name = "luasnip", keyword_length = 2 },
          { name = "path" },
          { name = "cmp_tabnine" },
          { name = "buffer", keyword_length = 5 },
          { name = "emoji" },
          { name = "nvim_lua" },
          { name = "neorg" },
        },
        formatting = {
          format = lspkind.cmp_format({
            with_text = true,
            maxwidth = 50,
            menu = {
              buffer = "[buf]",
              nvim_lsp = "[lsp]",
              nvim_lua = "[api]",
              path = "[path]",
              luasnip = "[snip]",
              cmp_tabnine = "[tabnine]",
              neorg = "[org]",
            },
          }),
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        experimental = {
          native_menu = false,
          ghost_text = true,
        },
        sorting = {
          priority_weight = 2,
          comparators = {
            fzf_compare,
            compare.offset,
            compare.exact,
            compare.score,
            compare.recently_used,
            compare.kind,
            compare.sort_text,
            compare.length,
            compare.order,
          },
        },
      })

      -- Setup completion on search mode
      cmp.setup.cmdline("/", {
        sources = cmp.config.sources({
          { name = "nvim_lsp_document_symbol" },
        }, {
          { name = "buffer" },
        }),
      })

      -- Setup completion on command mode
      cmp.setup.cmdline(":", {
        sources = cmp.config.sources({
          { name = "fuzzy_path", keyword_length = 3 },
          { name = "cmdline", keyword_length = 3 },
        }),
      })

      -- TODO: Add gitcommit support
    end,
  },
  {
    -- Autopairs
    "windwp/nvim-autopairs",
    dependencies = {
      "hrsh7th/nvim-cmp",
    },
    lazy = true,
    event = "InsertEnter",
    config = function()
      local npairs = require("nvim-autopairs")
      npairs.setup({
        check_ts = true,
        enable_check_bracket_line = true,
        map_bs = false,
      })

      -- Make it play nice with nvim-cmp
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      local cmp = require("cmp")
      cmp.event:on(
        "confirm_done",
        cmp_autopairs.on_confirm_done({ map_char = { tex = "" } })
      )
    end,
  },
  {
    "github/copilot.vim",
    config = function()
      vim.g.copilot_filetypes = {
        TelescopePrompt = false,
        TeleScopeResults = false,
        ["dap-repl"] = false,
      }
    end,
  },
}
