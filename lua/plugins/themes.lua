return {
  {
    "themercorp/themer.lua",
    lazy = false,
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      local themer = require("themer")

      themer.setup({
        colorscheme = "rose_pine", -- default colorscheme

        transparent = false,

        term_colors = true,

        dim_inactive = true,

        styles = {
          ["function"] = { style = "italic" },
          functionbuiltin = { style = "italic" },
        },

        plugins = {
          treesitter = true,
          indentline = true,
          bufferline = true,
          cmp = true,
          gitsigns = true,
          lsp = true,
          telescope = true,
        },

        enable_installer = true, -- enable installer module
      })

      vim.cmd([[
        hi default NeotestPassed ctermfg=Green guifg=#96F291
        hi default NeotestFailed ctermfg=Red guifg=#F70067
        hi default NeotestRunning ctermfg=Yellow guifg=#FFEC63
        hi default NeotestSkipped ctermfg=Cyan guifg=#00f1f5
        hi link NeotestTest Normal 
        hi default NeotestNamespace ctermfg=Magenta guifg=#D484FF
        hi default NeotestFocused gui=bold,underline cterm=bold,underline
        hi default NeotestFile ctermfg=Cyan guifg=#00f1f5
        hi default NeotestDir ctermfg=Cyan guifg=#00f1f5
        hi default NeotestIndent ctermfg=Grey guifg=#8B8B8B
        hi default NeotestExpandMarker ctermfg=Grey guifg=#8094b4
        hi default NeotestAdapterName ctermfg=Red guifg=#F70067
      ]])

      local telescope = require("telescope")
      telescope.load_extension("themes")
    end,
  },
}
