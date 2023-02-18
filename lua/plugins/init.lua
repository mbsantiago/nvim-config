return {
  { -- Icons
    "nvim-tree/nvim-web-devicons",
    config = true,
  },
  { -- Nvim lua development tools
    "folke/neodev.nvim",
    opts = {
      library = { plugins = { "nvim-dap-ui" }, types = true },
    },
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
  },
  {
    "akinsho/bufferline.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = true,
  },
  { -- Status line
    "nvim-lualine/lualine.nvim",
    config = true,
  },
  { -- File tree
    "kyazdani42/nvim-tree.lua",
    cmd = "NvimTreeToggle",
    config = true,
  },
  { -- Comments
    "numToStr/Comment.nvim",
    config = true,
  },
  {
    "anuvyklack/fold-preview.nvim",
    dependencies = { "anuvyklack/keymap-amend.nvim" },
    config = true,
  },
  { -- Make folds prettier
    "anuvyklack/pretty-fold.nvim",
    config = true,
  },
  { -- Git integration
    "lewis6991/gitsigns.nvim",
    config = true,
  },
  -- Python indentation
  "Vimjas/vim-python-pep8-indent",
  { -- Python folding
    "tmhedberg/simpylfold",
    config = function()
      vim.g["SimpylFold_fold_level"] = 0
      vim.g.simpylfold_fold_docstrings = 1
      vim.g.simpylfold_fold_multiline_comments = 1
    end,
  },
  -- Tim pope plugins
  "tpope/vim-surround",
  "tpope/vim-unimpaired",
  "tpope/vim-dispatch",
  -- See the Undo Tree
  "mbbill/undotree",
  { -- Autopairs
    "windwp/nvim-autopairs",
    opts = {
      check_ts = false,
      enable_check_bracket_line = true,
      map_bs = false,
    },
  },
  { -- Cursor line
    "yamatsum/nvim-cursorline",
    config = true,
  },
  { -- Colorizer
    "norcalli/nvim-colorizer.lua",
    config = true,
  },
  { -- Motion plugin
    "phaazon/hop.nvim",
    config = true,
  },
  { -- Indentation guide lines
    "lukas-reineke/indent-blankline.nvim",
    opts = {
      show_current_context = true,
      use_treesitter = true,
      show_trailing_blankline_indent = false,
    },
  },
  { -- Notifications
    "rcarriga/nvim-notify",
    config = true,
    opts = {
      background_colour = "#1e222a",
    },
  },
  "mattn/emmet-vim",
  {
    "simrat39/symbols-outline.nvim",
    opts = {
      auto_close = true,
      auto_preview = true,
      autofold_depth = 1,
      lsp_blacklist = { "pylsp" },
    },
  },
}
