return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-lua/popup.nvim",
      "stevearc/dressing.nvim",
      "tzachar/fuzzy.nvim",
      "themercorp/themer.lua",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
    },
    config = function()
      require("telescope").setup({
        defaults = {
          sorting_strategy = "ascending",
          file_ignore_patterns = { "node_modules/.*", "%.env" },
        },
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          },
        },
      })

      require("telescope").load_extension("fzf")
      require("telescope").load_extension("themes")
    end,
    lazy = true,
    event = "VeryLazy",
    keys = {
      {
        "<leader>ff",
        "<cmd>Telescope find_files<cr>",
        desc = "Files",
      },
      {
        "<leader>ft",
        "<cmd>Telescope live_grep theme=ivy<cr>",
        desc = "Text",
      },
      {
        "<leader>/",
        "<cmd>Telescope current_buffer_fuzzy_find theme=ivy<cr>",
        desc = "Text in Buffer",
      },
      {
        "<leader>fc",
        "<cmd>Telescope themes<cr>",
        desc = "Colorscheme/Theme",
      },
      {
        "<C-p>",
        "<cmd>Telescope commands<cr>",
        desc = "Command",
      },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help" },
      {
        "<leader>fr",
        "<cmd>Telescope oldfiles<cr>",
        desc = "Recent File",
      },
      {
        "<leader>fb",
        "<cmd>Telescope buffers<cr>",
        desc = "Buffers",
      },
      {
        "<leader>fR",
        "<cmd>Telescope registers<cr>",
        desc = "Registers",
      },
      { "<leader>fm", "<cmd>Telescope marks<cr>", desc = "Mark" },
      {
        "<leader>fz",
        "<cmd>Telescope spell_sugest<cr>",
        desc = "Spelling Suggestions",
      },
      {
        "<leader>fd",
        "<cmd>lua require'telescope.builtin'.find_files{ search_dirs = { '~/.config/nvim' } }<cr>",
        desc = "Config File",
      },
      -- LSP COMMANDS
      {
        "<leader>fs",
        "<cmd>Telescope lsp_document_symbols<cr>",
        desc = "Document Symbols",
      },
      {
        "<leader>fS",
        "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
        desc = "Workspace Symbols",
      },
      -- GIT COMMANDS
      {
        "<leader>gff",
        "<cmd>Telescope git_files<cr>",
        desc = "Git File",
      },
      {
        "<leader>gfb",
        "<cmd>Telescope git_branches<cr>",
        desc = "Git Branch",
      },
      {
        "<leader>gfs",
        "<cmd>Telescope git_status<cr>",
        desc = "Git File Status",
      },
      {
        "<leader>gfc",
        "<cmd>Telescope git_commits<cr>",
        desc = "Git Commit",
      },
    },
  },
  {
    "nvim-telescope/telescope-dap.nvim",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-telescope/telescope.nvim",
    },
    lazy = true,
    event = "VeryLazy",
    config = function()
      require("telescope").load_extension("dap")
    end,
  },
  {
    "keyvchan/telescope-find-pickers.nvim",
    config = function()
      require("telescope").load_extension("find_pickers")
    end,
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    lazy = true,
    event = "VeryLazy",
    keys = {
      {
        "<leader>fp",
        "<CMD>lua require 'telescope'.extensions.find_pickers.find_pickers()<CR>",
        desc = "Find Pickers",
      },
    },
  },
  {
    "debugloop/telescope-undo.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    lazy = true,
    event = "VeryLazy",
    config = function()
      require("telescope").load_extension("undo")
    end,
  },
}
