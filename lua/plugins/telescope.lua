return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-lua/popup.nvim",
      "nvim-telescope/telescope-frecency.nvim",
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
        pickers = {
          colorscheme = {
            enable_preview = true,
          },
        },
        extensions = {
          frecency = {
            auto_validate = true,
            max_timestamps = 20,
            show_scores = true,
          },
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          },
        },
      })

      require("telescope").load_extension("frecency")
      require("telescope").load_extension("fzf")
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
        "<cmd>Telescope colorscheme<cr>",
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
        [[<cmd>Telescope frecency workspace=CWD path_display={"shorten"}<cr>]],
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
      { "<leader>fM", "<cmd>Telescope marks<cr>", desc = "Mark" },
      {
        "<leader>fz",
        "<cmd>Telescope spell_sugest<cr>",
        desc = "Spelling Suggestions",
      },
      {
        "<leader>fd",
        function()
          require("telescope.builtin").find_files({
            search_dirs = { "~/.config/nvim" },
          })
        end,
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
      {
        "<leader>fm",
        "<cmd>Telescope man_pages<cr>",
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
}
