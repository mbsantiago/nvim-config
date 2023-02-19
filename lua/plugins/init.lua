return {
  { -- Icons
    "nvim-tree/nvim-web-devicons",
    config = true,
  },
  { -- Nvim lua development tools
    "folke/neodev.nvim",
    ft = "lua",
    lazy = true,
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
    lazy = false,
    config = true,
    keys = {
      { "<leader>c", "<cmd>bd<cr>", "Close Buffer" },
      { "<A-1>", ":BufferLineGoToBuffer 1<CR>", desc = "Go to buffer 1" },
      { "<A-2>", ":BufferLineGoToBuffer 2<CR>", desc = "Go to buffer 2" },
      { "<A-3>", ":BufferLineGoToBuffer 3<CR>", desc = "Go to buffer 3" },
      { "<A-4>", ":BufferLineGoToBuffer 4<CR>", desc = "Go to buffer 4" },
      { "<A-5>", ":BufferLineGoToBuffer 5<CR>", desc = "Go to buffer 5" },
      { "<A-6>", ":BufferLineGoToBuffer 6<CR>", desc = "Go to buffer 6" },
      { "<A-7>", ":BufferLineGoToBuffer 7<CR>", desc = "Go to buffer 7" },
      { "<A-8>", ":BufferLineGoToBuffer 8<CR>", desc = "Go to buffer 8" },
      { "<A-9>", ":BufferLineGoToBuffer 9<CR>", desc = "Go to buffer 9" },
      { "<A-b>", ":BufferLinePick<CR>", desc = "Pick Buffer" },
      { "<A-,>", ":BufferLineCycleNext<CR>", desc = "Next Buffer" },
      { "<A-.>", ":BufferLineCyclePrev<CR>", desc = "Previous Buffer" },
      { "<A->>", ":BufferLineMoveNext<CR>", desc = "Move Buffer Next" },
      { "<A-<>", ":BufferLineMovePrev<CR>", desc = "Move Buffer Prev" },
      {
        "<A-s>e",
        ":BufferLineSortByExtension<CR>",
        desc = "Sort Buffers by Extension",
      },
      {
        "<A-s>d",
        ":BufferLineSortByDirectory<CR>",
        desc = "Sort Buffers by Directory",
      },
    },
  },
  { -- Status line
    "nvim-lualine/lualine.nvim",
    lazy = false,
    config = true,
  },
  { -- File tree
    "kyazdani42/nvim-tree.lua",
    cmd = "NvimTreeToggle",
    lazy = true,
    config = true,
    keys = {
      { "<leader>be", "<cmd>NvimTreeToggle<cr>", desc = "Explorer" },
    },
  },
  { -- Comments
    "numToStr/Comment.nvim",
    config = true,
  },
  {
    "anuvyklack/fold-preview.nvim",
    dependencies = { "anuvyklack/keymap-amend.nvim" },
    config = true,
    event = "BufRead",
    lazy = true,
  },
  { -- Make folds prettier
    "anuvyklack/pretty-fold.nvim",
    config = true,
  },
  {
    -- Python indentation
    "Vimjas/vim-python-pep8-indent",
    ft = "python",
    lazy = true,
  },
  { -- Python folding
    "tmhedberg/simpylfold",
    ft = "python",
    lazy = true,
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
  {
    "mbbill/undotree",
    cmd = "UndotreeToggle",
    lazy = true,
    keys = {
      { "<leader>bu", "<cmd>UndotreeToggle<cr>", desc = "Undo Tree" },
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
  {
    "mattn/emmet-vim",
    ft = {
      "html",
      "css",
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
      "vue",
      "svelte",
      "markdown",
    },
    lazy = true,
  },
  {
    "roobert/search-replace.nvim",
    config = function()
      require("search-replace").setup({
        -- optionally override defaults
        default_replace_single_buffer_options = "gcI",
        default_replace_multi_buffer_options = "egcI",
      })
    end,
    keys = {
      {
        "<C-r>",
        "<CMD>SearchReplaceSingleBufferVisualSelection<CR>",
        mode = "v",
        desc = "Search and replace [visual selection]",
      },
      {
        "<C-s>",
        "<CMD>SearchReplaceWithinVisualSelection<CR>",
        mode = "v",
        desc = "Search and replace within visual selection",
      },
      {
        "<C-b>",
        "<CMD>SearchReplaceWithinVisualSelectionCWord<CR>",
        mode = "v",
        desc = "Search and replace within visual selection [word]",
      },
      {
        "<leader>rs",
        "<CMD>SearchReplaceSingleBufferSelections<CR>",
        mode = "n",
        desc = "Search and replace [buffer]",
      },
      {
        "<leader>ro",
        "<CMD>SearchReplaceSingleBufferOpen<CR>",
        desc = "Search and replace [buffer]",
        mode = "n",
      },
      {
        "<leader>rw",
        "<CMD>SearchReplaceSingleBufferCWord<CR>",
        mode = "n",
        desc = "Search and replace [word]",
      },
      {
        "<leader>rW",
        "<CMD>SearchReplaceSingleBufferCWORD<CR>",
        mode = "n",
        desc = "Search and replace [CWORD]",
      },
      {
        "<leader>re",
        "<CMD>SearchReplaceSingleBufferCExpr<CR>",
        mode = "n",
        desc = "Search and replace [CExpr]",
      },
      {
        "<leader>rf",
        "<CMD>SearchReplaceSingleBufferCFile<CR>",
        mode = "n",
        desc = "Search and replace [CFile]",
      },
      {
        "<leader>rbs",
        "<CMD>SearchReplaceMultiBufferSelections<CR>",
        mode = "n",
        desc = "Search and replace [buffer]",
      },
      {
        "<leader>rbo",
        "<CMD>SearchReplaceMultiBufferOpen<CR>",
        desc = "Search and replace Mulple Buffer",
        mode = "n",
      },
      {
        "<leader>rbw",
        "<CMD>SearchReplaceMultiBufferCWord<CR>",
        mode = "n",
        desc = "Search and replace Multi Buffer [word]",
      },
      {
        "<leader>rbW",
        "<CMD>SearchReplaceMultiBufferCWORD<CR>",
        mode = "n",
        desc = "Search and replace Multi Buffer [CWORD]",
      },
      {
        "<leader>rbe",
        "<CMD>SearchReplaceMultiBufferCExpr<CR>",
        mode = "n",
        desc = "Search and replace Multi Buffer [CExpr]",
      },
      {
        "<leader>rbf",
        "<CMD>SearchReplaceMultiBufferCFile<CR>",
        mode = "n",
        desc = "Search and replace Multi Buffer [CFile]",
      },
    },
  },
}
