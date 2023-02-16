return function()
  local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))

    return col ~= 0
        and vim.api
        .nvim_buf_get_lines(0, line - 1, line, true)[1]
        :sub(col, col)
        :match("%s")
        == nil
  end

  local cmp = safe_require("cmp")

  local compare = safe_require("cmp.config.compare")

  local fzf_compare = safe_require("cmp_fuzzy_buffer.compare")

  local luasnip = safe_require("luasnip")

  local lspkind = safe_require("lspkind")

  if not cmp
      or not luasnip
      or not lspkind
      or not compare
      or not fzf_compare
  then
    return
  end

  cmp.setup({
    snippet = {
      expand = function(args)
        require("luasnip").lsp_expand(args.body)
      end,
    },

    mapping = {
      ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
      ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
      ["<C-space>"] = cmp.mapping(
        cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Insert,
          select = true,
        }),
        { "i", "c" }
      ),
      ["<C-e>"] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ["<C-n>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        elseif has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<C-p>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { "i", "s" }),
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
    },

    formatting = {
      format = lspkind.cmp_format({
        with_text = true,
        maxwidth = 50,
        menu = {
          buffer = "[buf]",
          nvim_lsp = "[LSP]",
          nvim_lua = "[api]",
          path = "[path]",
          luasnip = "[snip]",
          cmp_tabnine = "[tabnine]",
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

  local cmp_autopairs = safe_require("nvim-autopairs.completion.cmp")

  if not cmp_autopairs then
    return
  end

  cmp.event:on(
    "confirm_done",
    cmp_autopairs.on_confirm_done({ map_char = { tex = "" } })
  )
end
