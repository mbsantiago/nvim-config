return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-lua/popup.nvim",
      "stevearc/dressing.nvim",
      "tzachar/fuzzy.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        config = function()
          require("telescope").load_extension("fzf")
        end,
      },
    },
    opts = {
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
    },
    cmd = "Telescope",
    keys = {
      {
        "<leader>f",
        "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
        desc = "Find Text",
      },
      {
        "<leader>F",
        "<cmd>Telescope live_grep theme=ivy<cr>",
        desc = "Find Text",
      },
      {
        "<leader>/",
        "<cmd>Telescope live_grep theme=ivy<cr>",
        desc = "Find in Buffer",
      },
      {
        "<leader>vc",
        "<cmd>Telescope colorscheme<cr>",
        desc = "Find Colorscheme",
      },
      {
        "<leader>vt",
        "<cmd>Telescope themes<cr>",
        desc = "Find Theme",
      },
      {
        "<leader>sB",
        "<cmd>Telescope git_branches<cr>",
        desc = "Search Checkout branch",
      },
      {
        "<leader>sc",
        "<cmd>Telescope themes<cr>",
        desc = "Search Colorscheme",
      },
      { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Search Help" },
      {
        "<leader>sM",
        "<cmd>Telescope man_pages<cr>",
        desc = "Search Man Pages",
      },
      {
        "<leader>sr",
        "<cmd>Telescope oldfiles<cr>",
        desc = "Search Open Recent File",
      },
      {
        "<leader>sf",
        "<cmd>Telescope find_files<cr>",
        desc = "Search Files",
      },
      { "<leader>sb", "<cmd>Telescope buffers<cr>", desc = "Search Buffers" },
      {
        "<leader>sR",
        "<cmd>Telescope registers<cr>",
        desc = "Search Registers",
      },
      { "<leader>sm", "<cmd>Telescope marks<cr>", desc = "Search Marks" },
      { "<leader>st", "<cmd>Telescope tags<cr>", desc = "Search Tags" },
      {
        "<leader>sT",
        "<cmd>Telescope current_buffer_tags<cr>",
        desc = "Search Tag in Buffer",
      },
      {
        "<leader>sq",
        "<cmd>Telescope quickfix<cr>",
        desc = "Search in Quickfix List",
      },
      {
        "<leader>sl",
        "<cmd>Telescope locfix<cr>",
        desc = "Search in Location List",
      },
      {
        "<leader>ss",
        "<cmd>Telescope search_history<cr>",
        desc = "Search History",
      },
      {
        "<leader>wz",
        "<cmd>Telescope spell_sugest<cr>",
        desc = "Search Spelling Suggestions",
      },
      {
        "<leader>go",
        "<cmd>Telescope git_status<cr>",
        desc = "Git Open changed file",
      },
      {
        "<leader>gb",
        "<cmd>Telescope git_branches<cr>",
        desc = "Git Checkout branch",
      },
      {
        "<leader>c",
        "<cmd>Telescope git_commits<cr>",
        desc = "Git Checkout commit",
      },
    },
  },
}
