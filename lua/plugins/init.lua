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
    opts = {
      options = {
        diagnostics = "nvim_lsp",
        always_show_bufferline = false,
        offsets = {
          {
            filetype = "neo-tree",
            text = "Neo-tree",
            highlight = "Directory",
            text_align = "left",
          },
        },
      },
    },
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
      {
        "<A-.>",
        ":BufferLineCyclePrev<CR>",
        desc = "Previous Buffer",
      },
      {
        "<A->>",
        ":BufferLineMoveNext<CR>",
        desc = "Move Buffer Next",
      },
      {
        "<A-<>",
        ":BufferLineMovePrev<CR>",
        desc = "Move Buffer Prev",
      },
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
    config = function( --[[  ]])
      vim.g["SimpylFold_fold_level"] = 0
      vim.g.simpylfold_fold_docstrings = 1
      vim.g.simpylfold_fold_multiline_comments = 1
    end,
  },
  {
    "kylechui/nvim-surround",
    config = true,
  },
  { "tpope/vim-repeat", event = "VeryLazy" },
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
      char = "│",
      filetype_exclude = {
        "help",
        "alpha",
        "dashboard",
        "neo-tree",
        "Trouble",
        "lazy",
      },
      show_trailing_blankline_indent = false,
    },
  },
  { -- Notifications
    "rcarriga/nvim-notify",
    config = true,
    keys = {
      {
        "<leader>un",
        function()
          require("notify").dismiss({ silent = true, pending = true })
        end,
        desc = "Delete all Notifications",
      },
    },
    opts = {
      timeout = 3000,
      max_height = function()
        return math.floor(vim.o.lines * 0.75)
      end,
      max_width = function()
        return math.floor(vim.o.columns * 0.75)
      end,
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
  {
    "folke/twilight.nvim",
    config = true,
    lazy = true,
    cmd = "Twilight",
  },
  {
    "folke/zen-mode.nvim",
    config = true,
    lazy = true,
    cmd = "ZenMode",
  },
  {
    "folke/noice.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    opts = {
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      presets = {
        bottom_search = false,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = false,
        lsp_doc_border = true,
      },
    },
  },
  {
    "folke/todo-comments.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = true,
  },
  {
    "stevearc/dressing.nvim",
    lazy = true,
    init = function()
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.select = function(...)
        require("lazy").load({ plugins = { "dressing.nvim" } })
        return vim.ui.select(...)
      end

      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.input = function(...)
        require("lazy").load({ plugins = { "dressing.nvim" } })
        return vim.ui.input(...)
      end
    end,
  },
  {
    "numToStr/Navigator.nvim",
    config = true,
    lazy=false,
    keys = {
      {
        "<A-h>",
        "<CMD>NavigatorLeft<CR>",
        desc = "Navigate left",
        mode = {"n", "t"},
      },
      {
        "<A-j>",
        "<CMD>NavigatorDown<CR>",
        desc = "Navigate down",
        mode = {"n", "t"},
      },
      {
        "<A-k>",
        "<CMD>NavigatorUp<CR>",
        desc = "Navigate up",
        mode = {"n", "t"},
      },
      {
        "<A-l>",
        "<CMD>NavigatorRight<CR>",
        desc = "Navigate right",
        mode = {"n", "t"},
      },
      {
        "<A-p>",
        "<CMD>NavigatorPrevious<CR>",
        desc = "Navigate previous",
      },
    },
  },
}
