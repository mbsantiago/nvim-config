-- enable native syntax highlighting
vim.cmd([[syntax enable]])

local o = vim.opt

-- Wrap lines
o.textwidth = 0
o.wrap = true
o.wm = 16
o.linebreak = true
o.winwidth = 80
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
