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
    },
    lazy = false,
    config = true,
    opts = {
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
        always_show_bufferline = false,
        separator_style = "slope",
        hover = {
          enabled = true,
          delay = 200,
          reveal = { "close" },
        },
        indicator = {
          style = "underline",
        },
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
        },
      },
    },
    keys = {
      { "<leader>bc", "<cmd>bd<cr>", desc = "Close Buffer" },
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
      { "<leader>bf", ":BufferLinePick<CR>", desc = "Pick Buffer" },
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
    opts = {
      options = {
        component_separators = "|",
        section_separators = { left = "", right = "" },
        disabled_filetypes = {
          statusline = {
            "NvimTree",
            "dashboard",
            "undotree",
            "neotest-summary",
          },
        },
      },
      sections = {
        lualine_a = {
          { "mode", separator = { left = "" }, right_padding = 2 },
        },
        lualine_b = { "filename", "branch" },
        lualine_c = { "diff" },
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
      extensions = {},
    },
  },
  {
    -- File tree
    "kyazdani42/nvim-tree.lua",
    cmd = "NvimTreeToggle",
    lazy = true,
    config = true,
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
      { "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "Undo Tree" },
    },
  },
  {
    -- Notifications
    "rcarriga/nvim-notify",
    config = true,
    keys = {
      {
        "<leader>uc",
        function()
          require("notify").dismiss({ silent = true, pending = true })
        end,
        desc = "Clear all Notifications",
      },
    },
    -- opts = {
    --   timeout = 3000,
    --   max_height = function()
    --     return math.floor(vim.o.lines * 0.75)
    --   end,
    --   max_width = function()
    --     return math.floor(vim.o.columns * 0.75)
    --   end,
    -- },
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
      vim.o.inccommand = "split"
    end,
    cmd = {
      "SearchReplaceSingleBufferOpen",
      "SearchReplaceMultiBufferOpen",
    },
    keys = {
      {
        "<C-r>",
        "<CMD>SearchReplaceSingleBuffer<CR>",
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
    },
  },
  {
    "folke/zen-mode.nvim",
    config = true,
    lazy = true,
    cmd = "ZenMode",
    keys = {
      {
        "<leader>uz",
        "<CMD>ZenMode<CR>",
        desc = "Zen Mode",
      },
    },
  },
  {
    "folke/noice.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    opts = {
      messages = {
        view = "mini",
        view_warn = "mini",
      },
      lsp = {
        progress = {
          enabled = false,
        },
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
        message = {
          view = "mini",
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
    lazy = false,
    keys = {
      {
        "<leader>um",
        "<CMD>Noice<CR>",
        desc = "View messages",
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
    "m4xshen/smartcolumn.nvim",
    opts = {
      disabled_filetypes = { "help", "text", "markdown", "dashboard" },
    },
  },
  {
    "ahmedkhalf/project.nvim",
    lazy = true,
    event = "VeryLazy",
    config = function()
      require("project_nvim").setup({
        silent_chdir = false,
        ignore_lsp = { "lua_ls", "null-ls" },
        exclude_dirs = { "**/vendor/**", "**/.venvs/**" },
      })
      require("telescope").load_extension("projects")
    end,
    keys = {
      {
        "<leader>fP",
        "<CMD>Telescope projects<CR>",
        desc = "Projects",
      },
    },
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
  },
  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    lazy = true,
    cmd = "Neorg",
    opts = {
      load = {
        ["core.defaults"] = {}, -- Loads default behaviour
        ["core.keybinds"] = {
          config = {
            neorg_leader = "<leader>",
          },
        },
        ["core.norg.concealer"] = {}, -- Adds pretty icons to your documents
        ["core.norg.journal"] = {
          config = {
            workspace = "journal",
          },
        },
        ["core.norg.completion"] = {
          config = {
            engine = "nvim-cmp",
          },
        },
        ["core.norg.dirman"] = { -- Manages Neorg workspaces
          config = {
            default_workspace = "notes",
            workspaces = {
              meetings = "~/Documents/Notes/meetings",
              papers = "~/Documents/Notes/papers",
              notes = "~/Documents/Notes/notes",
              ideas = "~/Documents/Notes/ideas",
              journal = "~/Documents/Notes/journal",
            },
          },
        },
        ["core.export"] = {},
        ["core.integrations.treesitter"] = {},
        ["core.integrations.nvim-cmp"] = {},
        ["core.integrations.zen_mode"] = {},
        ["core.integrations.telescope"] = {},
      },
    },
    dependencies = { "nvim-lua/plenary.nvim", "nvim-neorg/neorg-telescope" },
    keys = {
      {
        "<leader>no",
        "<cmd>Neorg<cr>",
        desc = "Open Menu",
      },
      {
        "<leader>nw",
        "<cmd>Telescope neorg switch_workspace<cr>",
        desc = "Change Workspace",
      },
      {
        "<leader>nj",
        "<cmd>Neorg journal<cr>",
        desc = "Journal",
      },
      {
        "<leader>nfl",
        "<cmd>Telescope neorg find_linkable<cr>",
        desc = "Linkable",
      },
      {
        "<leader>nff",
        "<cmd>Telescope neorg find_norg_files<cr>",
        desc = "File",
      },
      {
        "<leader>nfh",
        "<cmd>Telescope neorg search_headings<cr>",
        desc = "Heading",
      },
      {
        "<leader>nft",
        "<cmd>Telescope neorg find_project_task<cr>",
        desc = "Task",
      },
      {
        "<leader>nfi",
        "<cmd>Telescope neorg insert_link<cr>",
        desc = "Insert Link",
      },
    },
  },
}
