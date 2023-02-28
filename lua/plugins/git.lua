return {
  { -- Git integration
    "lewis6991/gitsigns.nvim",
    config = true,
    event = "BufRead",
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
  {
    "sindrets/diffview.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = true,
    cmd = {
      "DiffviewOpen",
      "DiffviewToggleFiles",
      "DiffviewFocusFiles",
      "DiffviewFileHistory",
    },
    -- TODO: Add keybindings
  },
  {
    "paopaol/telescope-git-diffs.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
    },
    config = function()
      require("telescope").load_extension("git_diffs")
    end,
    -- TODO: Add keybindings
  },
}
