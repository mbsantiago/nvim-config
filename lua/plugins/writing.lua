return {
  { -- Latex plugins
    "lervag/vimtex",
    lazy = true,
    ft = "tex",
    dependencies = {
      "folke/which-key.nvim",
    },
    config = function()
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

      require("which-key").register({
        w = { name = "Writing", l = { name = "LaTeX" } },
      }, {
        mode = "n",
        buffer = nil,
        silent = true,
        noremap = true,
        nowait = true,
        prefix = "<leader>",
      })
    end,
    keys = {
      {
        "<leader>wla",
        "<Plug>(vimtex-context-menu)<cr>",
        desc = "Context Menu",
      },
      { "<leader>wlc", "<Plug>(vimtex-clean)<cr>", desc = "Clean" },
      {
        "<leader>wlC",
        "<Plug>(vimtex-clean-full)<cr>",
        desc = "Clean Full",
      },
      { "<leader>wle", "<Plug>(vimtex-errors)<cr>", desc = "Errors" },
      { "<leader>wlg", "<Plug>(vimtex-status)<cr>", desc = "Status" },
      {
        "<leader>wlG",
        "<Plug>(vimtex-status-all)<cr>",
        desc = "Status All",
      },
      { "<leader>wli", "<Plug>(vimtex-info)<cr>", desc = "Info" },
      {
        "<leader>wlI",
        "<Plug>(vimtex-info-full)<cr>",
        desc = "Info Full",
      },
      { "<leader>wlk", "<Plug>(vimtex-stop)<cr>", desc = "Stop" },
      {
        "<leader>wlK",
        "<Plug>(vimtex-stop-all)<cr>",
        desc = "Stop All",
      },
      {
        "<leader>wll",
        "<Plug>(vimtex-compile)<cr>",
        desc = "Compile",
      },
      {
        "<leader>wlL",
        "<Plug>(vimtex-compile-selected)<cr>",
        desc = "Compile Selected",
      },
      {
        "<leader>wlm",
        "<Plug>(vimtex-imaps-list)<cr>",
        desc = "List imaps",
      },
      {
        "<leader>wlo",
        "<Plug>(vimtex-compile-output)<cr>",
        desc = "Compile and Output",
      },
      { "<leader>wlq", "<Plug>(vimtex-log)<cr>", desc = "Log" },
      {
        "<leader>wls",
        "<Plug>(vimtex-toggle-main)<cr>",
        desc = "Toggle Main",
      },
      {
        "<leader>wlt",
        "<Plug>(vimtex-toc-open)<cr>",
        desc = "Open Table of Contents",
      },
      {
        "<leader>wlT",
        "<Plug>(vimtex-toc-toggle)<cr>",
        desc = "Toggle Table of Contents",
      },
      { "<leader>wlv", "<Plug>(vimtex-view)<cr>", desc = "View" },
      {
        "<leader>wlX",
        "<Plug>(vimtex-reload-state)<cr>",
        desc = "Reload State",
      },
      {
        "<leader>wlx",
        "<Plug>(vimtex-reload)<cr>",
        desc = "Reload",
      },
    },
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
      {
        "<leader>wp",
        ":MarkdownPreviewToggle<cr>",
        desc = "Markdown Preview",
      },
    },
  },
}
