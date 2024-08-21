return {
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-emoji",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lsp",
      "tzachar/cmp-fuzzy-path",
      "tzachar/fuzzy.nvim",
      "onsails/lspkind-nvim",
      "mbsantiago/cmp-bibtex",
      "jalvesaq/cmp-zotcite",
    },
    config = function()
      local cmp = require("cmp")
      local lspkind = require("lspkind")
      local luasnip = require("luasnip")

      lspkind.init({
        symbol_map = {
          Copilot = "",
        },
      })

      vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = {
          ["<C-n>"] = cmp.mapping.select_next_item(),
          ["<C-p>"] = cmp.mapping.select_prev_item(),
          ["<C-d>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.close(),

          -- Complete or expand
          ["<CR>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              if luasnip.expandable() then
                luasnip.expand()
              else
                cmp.confirm({
                  behavior = cmp.ConfirmBehavior.Insert,
                  select = true,
                })
              end
            else
              fallback()
            end
          end),

          -- Jump forward in the snippet
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.locally_jumpable(1) then
              luasnip.jump(1)
            else
              fallback()
            end
          end, { "i", "s" }),

          -- Jump backward in the snippet
          ["<C-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        },
        -- Sources order are actually their priority order
        sources = {
          { name = "copilot", group_index = 2 },
          { name = "lazydev" },
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "bibtex" },
          { name = "cmp_zotcite" },
          { name = "path" },
        },
        formatting = {
          format = function(entry, vim_item)
            if entry.source.name == "bibtex" then
              return require("cmp_bibtex.formatting").format(entry, vim_item)
            end

            return lspkind.cmp_format({
              mode = "symbol_text",
              menu = {
                buffer = "[buf]",
                nvim_lsp = "[lsp]",
                lazydev = "[nvim]",
                path = "[path]",
                luasnip = "[snip]",
                nvim_lsp_document_symbol = "[sym]",
              },
              show_labelDetails = true,
            })(entry, vim_item)
          end,
        },
        completion = {
          completeopt = "menu,menuone,noinsert",
        },
        preselect = cmp.PreselectMode.Item,
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
      })

      -- Setup completion on search mode
      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "buffer" },
        }),
      })

      -- Setup completion on command mode
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "fuzzy_path", keyword_length = 3 },
          { name = "cmdline", keyword_length = 3 },
        }),
        matching = { disallow_symbol_nonprefix_matching = false },
      })
    end,
  },
  {
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
}
