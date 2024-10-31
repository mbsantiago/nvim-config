-- enable native syntax highlighting
vim.cmd([[syntax enable]])

local o = vim.opt

-- Wrap lines
o.wrap = true
o.linebreak = true
o.conceallevel = 2
o.sidescroll = 5
o.formatoptions = o.formatoptions + { t = true, l = true }

vim.api.nvim_set_keymap("n", "k", "gk", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "j", "gj", { noremap = true, silent = true })

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
