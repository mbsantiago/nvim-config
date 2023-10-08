return {
  {
    -- Git integration
    "lewis6991/gitsigns.nvim",
    event = "BufRead",
    cmd = "Gitsigns",
    opts = {
      current_line_blame = true,
    },
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
    keys = {
      {
        "<leader>gd",
        "<cmd>DiffviewOpen HEAD -- %<cr>",
        desc = "Diff Current File",
      },
      {
        "<leader>gD",
        "<cmd>DiffviewOpen<cr>",
        desc = "Diff All Files",
      },
      {
        "<leader>gh",
        "<cmd>DiffviewFileHistory %<cr>",
        desc = "Current File History",
      },
      { "<leader>gH", "<cmd>DiffviewFileHistory %<cr>", desc = "Git History" },
      {
        "<leader>gc",
        "<cmd>DiffviewClose<cr>",
        desc = "Close Diffview",
      },
    },
  },
  {
    "pwntester/octo.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    lazy = true,
    cmd = "Octo",
    config = function()
      require("octo").setup()
    end,
    keys = {
      {
        "<leader>oi",
        "<cmd>Octo issue list<cr>",
        desc = "Issue List",
      },
      {
        "<leader>op",
        "<cmd>Octo pr list<cr>",
        desc = "Pull Request List",
      },
      {
        "<leader>or",
        "<cmd>Octo repo list<cr>",
        desc = "Issue List",
      },
      {
        "<leader>oca",
        "<cmd>Octo comment add<cr>",
        desc = "Add comment",
      },
      {
        "<leader>ocd",
        "<cmd>Octo comment delete<cr>",
        desc = "Delete comment",
      },
      {
        "<leader>oa",
        "<cmd>Octo actions<cr>",
        desc = "List actions",
      },
      {
        "<leader>os",
        "<cmd>Octo search<cr>",
        desc = "Search",
      },
    },
  },
}
