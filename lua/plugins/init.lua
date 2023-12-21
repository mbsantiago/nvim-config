---@diagnostic disable: unused-local
return {
  {
    -- Icons
    "nvim-tree/nvim-web-devicons",
    opts = {
      override = {
        ["exe"] = {
          icon = "",
          color = "#f28ba2",
          cterm_color = "211",
          name = "Exe",
        }
      }
    }
  },
  {
    -- Status line
    "nvim-lualine/lualine.nvim",
    lazy = false,
    config = function()
      require("lualine").setup({
        options = {
          theme = "onedark",
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
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    config = function()
      require("Comment").setup({
        pre_hook = require(
          "ts_context_commentstring.integrations.comment_nvim"
        ).create_pre_hook(),
      })
    end,
  },
  {
    "kylechui/nvim-surround",
    config = true,
  },
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
