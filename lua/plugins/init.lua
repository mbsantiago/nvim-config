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
    keys = {
      { "<leader>c", "<cmd>bd<cr>", "Close Buffer" },
    },
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
    cmd = "Gitsigns",
    keys = {
      {
        "<leader>gj",
        "<cmd>lua require('gitsigns').next_hunk()<cr>",
        desc = "Git Next Hunk",
      },
      {
        "<leader>gk",
        "<cmd>lua require('gitsigns').prev_hunk()<cr>",
        desc = "Git Prev Hunk",
      },
      {
        "<leader>gb",
        "<cmd>lua require('gitsigns').blame_line()<cr>",
        desc = "Git Blame Line",
      },
      {
        "<leader>gp",
        "<cmd>lua require('gitsigns').preview_hunk()<cr>",
        desc = "Git Preview Hunk",
      },
      {
        "<leader>gr",
        "<cmd>lua require('gitsigns').reset_hunk()<cr>",
        desc = "Git Reset Hunk",
      },
      {
        "<leader>gR",
        "<cmd>lua require('gitsigns').reset_buffer()<cr>",
        desc = "Git Reset Buffer",
      },
      {
        "<leader>gs",
        "<cmd>lua require('gitsigns').stage_hunk()<cr>",
        desc = "Git Stage Hunk",
      },
      {
        "<leader>gu",
        "<cmd>lua require('gitsigns').undo_stage_hunk()<cr>",
        desc = "Git Undo Stage Hunk",
      },
      {
        "<leader>gS",
        "<cmd>lua require('gitsigns').stage_buffer()<cr>",
        desc = "Git Stage Buffer",
      },
      {
        "<leader>gP",
        "<cmd>lua require('gitsigns').preview_buffer()<cr>",
        desc = "Git Preview Buffer",
      },
      {
        "<leader>gB",
        "<cmd>lua require('gitsigns').blame_buffer()<cr>",
        desc = "Git Blame Buffer",
      },
      { "<leader>gd", "<cmd>Gitsigns diffthis HEAD<cr>", desc = "Git Diff" },
    },
  },
  -- Python indentation
  "Vimjas/vim-python-pep8-indent",
  { -- Python folding
    "tmhedberg/simpylfold",
    config = function(--[[  ]])
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
    dependencies = {
      "hrsh7th/nvim-cmp",
    },
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
    keys = {
      { "n", "<leader><leader>w", "<cmd>HopWord<cr>", desc = "Hop to Word" },
      {
        "n",
        "<leader><leader>p",
        "<cmd>HopPattern<cr>",
        desc = "Hop to Pattern",
      },
      { "n", "<leader><leader>l", "<cmd>HopLine<cr>", desc = "Hop to Line" },
      {
        "n",
        "<leader><leader>L",
        "<cmd>HopLineStart<cr>",
        desc = "Hop to Line Start",
      },
      {
        "n",
        "<leader><leader>c",
        "<cmd>HopChar1<cr>",
        desc = "Hop to Character",
      },
      {
        "n",
        "<leader><leader>C",
        "<cmd>HopChar2<cr>",
        desc = "Hop to Characters [2]",
      },
      {
        "n",
        "<leader><leader>a",
        "<cmd>HopAnywhere<cr>",
        desc = "Hop Anywhere",
      },
    },
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
