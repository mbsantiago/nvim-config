return {
  { -- Latex plugins
    "lervag/vimtex",
    lazy = true,
    ft = "tex",
    config = function()
      -- TODO: update to use lua autocommands API
      vim.cmd([[
        augroup vimtex_mac
          autocmd!
          autocmd FileType tex syntax enable
        augroup END
      ]])

      -- Special vim formatting for latex files
      vim.g["vimtex_format_enabled"] = 1

      -- Viewer options: One may configure the viewer either by specifying a built-in
      -- viewer method:
      -- let g:vimtex_view_method = 'zathura'

      -- Or with a generic interface:
      vim.g["vimtex_view_general_viewer"] = "okular"

      vim.g["vimtex_view_general_options"] = "--unique file:@pdf#src:@line@tex"

      -- Folding
      vim.g["vimtex_fold_enabled"] = 1

      vim.g["vimtex_fold_types"] = {
        sections = {
          parse_levels = 0,
          sections = {
            "%(add)?part",
            "%(chapter|addchap)",
            "%(section|addsec)",
            "subsection",
            "subsubsection",
            "paragraph",
          },
          parts = {
            "appendix",
            "frontmatter",
            "mainmatter",
            "backmatter",
          },
        },
      }

      vim.g.vimtex_imaps_enabled = 1

      vim.g.vimtex_imaps_leader = "´"

      vim.fn["vimtex#imaps#add_map"]({
        lhs = "test",
        rhs = "\tested",
        wrapper = "vimtex#imaps#wrap_trivial",
      })
    end,
  },
  {
    "voldikss/vim-translator", -- Translator,
    lazy = true,
    keys = {
      { "<leader>wt", "<Plug>Translate<cr>", desc = "Translate" },
      { "<leader>ww", "<Plug>TranslateW<cr>", desc = "Translate Window" },
      { "<leader>wr", "<Plug>TranslateR<cr>", desc = "Translate Replace" },
    },
    cmd = { "Translate", "TranslateW", "TranslateR" },
  },
  {
    "ron89/thesaurus_query.vim", -- Thesaurus
    lazy = true,
    config = function()
      vim.g.tq_enabled_backends = {
        "openoffice_en",
        "mthesaur_txt",
        "datamuse_com",
      }
      vim.g.tq_openoffice_en_file = "/usr/share/myspell/dicts/th_en_US_new"
      vim.g.tq_mthesaur_file = "/home/santiago/.vim/thesaurus/mthesaur.txt"
      vim.g.tq_map_keys = 0
    end,
    keys = {
      {
        "<leader>ws",
        ":ThesaurusQueryReplaceCurrentWord<cr>",
        desc = "Replace Thesaurus",
      },
    },
  },
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    config = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
    keys = {
      { "<leader>wp", ":MarkdownPreviewToggle<cr>", desc = "Markdown Preview" },
    },
  },
}