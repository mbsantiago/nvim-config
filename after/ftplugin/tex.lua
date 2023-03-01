-- enable native syntax highlighting
vim.cmd([[syntax enable]])

require("cmp").setup.buffer({
  formatting = {
    format = function(entry, vim_item)
      vim_item.menu = ({
        omni = "[VimTeX]",
        buffer = "[Buffer]",
        nvim_lsp = "[LSP]",
        luasnip = "[Snippet]",
        path = "[path]",
      })[entry.source.name]
      return vim_item
    end,
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "buffer" },
    { name = "luasnip", keyword_length = 2 },
    { name = "path" },
    { name = "omni" },
  },
})
