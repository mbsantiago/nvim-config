---@diagnostic disable: unused-local
return {
  {
    -- Icons
    "nvim-tree/nvim-web-devicons",
    config = true,
  },
  {
    "akinsho/bufferline.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "rose-pine/neovim",
    },
    lazy = false,
    config = function()
      require("bufferline").setup({
        options = {
          diagnostics_indicator = function(
            count,
            level,
            diagnostics_dict,
            context
          )
            local s = " "
            for e, n in pairs(diagnostics_dict) do
              local sym = e == "error" and " "
                  or (e == "warning" and " " or " ")
              s = s .. n .. sym
            end
            return s
          end,
          diagnostics = "nvim_lsp",
          separator_style = "thin",
          indicator = {
            style = "underline",
          },
          themable = true,
          always_show_bufferline = false,
          enforce_regular_tabs = false,
          color_icons = true,
          show_buffer_icons = true,
          show_buffer_close_icons = true,
          show_close_icon = true,
          show_tab_indicators = true,
          numbers = "ordinal",
          offsets = {
            {
              filetype = "NvimTree",
              text = "File Explorer",
              text_align = "center",
              separator = false,
            },
            {
              filetype = "neo-tree",
              text = "Neo-tree",
              highlight = "Directory",
              text_align = "left",
            },
            {
              filetype = "DiffviewFiles",
              text = "Diffview Files",
              text_align = "center",
              separator = false,
            },
            {
              filetype = "neotest-summary",
              text = "Tests",
              text_align = "center",
              separator = false,
            },
            {
              filetype = "lspsagaoutline",
              text = "LSP Outline",
              text_align = "center",
              separator = false,
            },
          },
        },
      })
    end,
    keys = {
      { "<leader>bc", "<cmd>bd<cr>",              desc = "Close Buffer" },
      {
        "<leader>b1",
        ":BufferLineGoToBuffer 1<CR>",
        desc = "Go to buffer 1",
      },
      {
        "<leader>b2",
        ":BufferLineGoToBuffer 2<CR>",
        desc = "Go to buffer 2",
      },
      {
        "<leader>b3",
        ":BufferLineGoToBuffer 3<CR>",
        desc = "Go to buffer 3",
      },
      {
        "<leader>b4",
        ":BufferLineGoToBuffer 4<CR>",
        desc = "Go to buffer 4",
      },
      {
        "<leader>b5",
        ":BufferLineGoToBuffer 5<CR>",
        desc = "Go to buffer 5",
      },
      {
        "<leader>b6",
        ":BufferLineGoToBuffer 6<CR>",
        desc = "Go to buffer 6",
      },
      {
        "<leader>b7",
        ":BufferLineGoToBuffer 7<CR>",
        desc = "Go to buffer 7",
      },
      {
        "<leader>b8",
        ":BufferLineGoToBuffer 8<CR>",
        desc = "Go to buffer 8",
      },
      {
        "<leader>b9",
        ":BufferLineGoToBuffer 9<CR>",
        desc = "Go to buffer 9",
      },
      { "<leader>bf", ":BufferLinePick<CR>",      desc = "Pick Buffer" },
      { "<leader>bn", ":BufferLineCycleNext<CR>", desc = "Next Buffer" },
      {
        "<leader>bp",
        ":BufferLineCyclePrev<CR>",
        desc = "Previous Buffer",
      },
      {
        "<leader>bl",
        ":BufferLineMoveNext<CR>",
        desc = "Move Buffer Next",
      },
      {
        "<leader>bh",
        ":BufferLineMovePrev<CR>",
        desc = "Move Buffer Prev",
      },
    },
  },
  {
    -- Status line
    "nvim-lualine/lualine.nvim",
    lazy = false,
    config = function()
      require("lualine").setup({
        options = {
          component_separators = "|",
          section_separators = { left = "", right = "" },
          disabled_filetypes = {
            statusline = {
              "dashboard",
              "undotree",
              "neotest-summary",
              "lspsagaoutline",
              "DiffviewFiles",
            },
          },
        },
        sections = {
          lualine_a = {
            { "mode", separator = { left = "" }, right_padding = 2 },
          },
          lualine_b = {
            "filename",
            {
              "branch",
              on_click = function()
                _G._LAZYGIT_TOGGLE()
              end,
            },
          },
          lualine_c = {
            {
              "diff",
              on_click = function()
                vim.cmd("DiffviewOpen HEAD -- %")
              end,
            },
          },
          lualine_x = {
            {
              "diagnostics",
              on_click = function()
                require("trouble").toggle("document_diagnostics")
              end,
            },
          },
          lualine_y = {
            "filetype",
          },
          lualine_z = {
            { "location", separator = { right = "" }, left_padding = 2 },
          },
        },
        inactive_sections = {
          lualine_a = { "filename" },
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = { "filetype" },
        },
        tabline = {},
        extensions = {
          "lazy",
          "nvim-tree",
          "symbols-outline",
          "trouble",
          "toggleterm",
          "nvim-dap-ui",
          "quickfix",
          "man",
          {
            sections = { lualine_a = { "filetype" } },
            filetypes = { "noice" },
          },
        },
      })
    end,
  },
  {
    -- File tree
    "kyazdani42/nvim-tree.lua",
    cmd = "NvimTreeToggle",
    lazy = true,
    opts = {
      hijack_cursor = true,
      diagnostics = {
        enable = true,
      },
      modified = {
        enable = true,
      },
      view = {
        cursorline = true,
      },
      renderer = {
        add_trailing = true,
        group_empty = true,
        highlight_git = true,
        highlight_opened_files = "name",
        root_folder_label = false,
        indent_markers = {
          enable = true,
        },
      },
      live_filter = {
        prefix = " search: ",
        always_show_folders = false,
      },
    },
    keys = {
      { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Explorer" },
    },
  },
  {
    -- Comments
    "numToStr/Comment.nvim",
    config = true,
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
      { "<leader>U", "<cmd>UndotreeToggle<cr>", desc = "Undo Tree" },
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
    "folke/todo-comments.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = true,
  },
  {
    "stevearc/dressing.nvim",
    lazy = true,
    opts = {
      input = {
        border = "solid",
      },
      select = {
        border = "solid",
      },
    },
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
}
