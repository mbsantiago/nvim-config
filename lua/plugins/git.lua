return {
  {
    -- Git integration
    "lewis6991/gitsigns.nvim",
    event = "BufRead",
    cmd = "Gitsigns",
    opts = {
      current_line_blame = true,
      signs = {
        add = { text = "┃" },
        change = { text = "┃" },
        delete = { text = "━" },
        topdelete = { text = "━" },
        changedelete = { text = "~" },
        untracked = { text = "╏" },
      },
    },
    keys = {
      {
        "<leader>gsj",
        "<cmd>lua require('gitsigns').next_hunk()<cr>",
        desc = "Git Next Hunk",
      },
      {
        "<leader>gsk",
        "<cmd>lua require('gitsigns').prev_hunk()<cr>",
        desc = "Git Prev Hunk",
      },
      {
        "<leader>gsp",
        "<cmd>lua require('gitsigns').preview_hunk()<cr>",
        desc = "Git Preview Hunk",
      },
      {
        "<leader>gsr",
        "<cmd>lua require('gitsigns').reset_hunk()<cr>",
        desc = "Git Reset Hunk",
      },
      {
        "<leader>gsR",
        "<cmd>lua require('gitsigns').reset_buffer()<cr>",
        desc = "Git Reset Buffer",
      },
      {
        "<leader>gss",
        "<cmd>lua require('gitsigns').stage_hunk()<cr>",
        desc = "Git Stage Hunk",
      },
      {
        "<leader>gsu",
        "<cmd>lua require('gitsigns').undo_stage_hunk()<cr>",
        desc = "Git Undo Stage Hunk",
      },
      {
        "<leader>gsS",
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
        "<leader>gdo",
        "<cmd>DiffviewOpen HEAD -- %<cr>",
        desc = "Diff Current File",
      },
      {
        "<leader>gda",
        "<cmd>DiffviewOpen<cr>",
        desc = "Diff All Files",
      },
      {
        "<leader>gdh",
        "<cmd>DiffviewFileHistory %<cr>",
        desc = "Current File History",
      },
      {
        "<leader>gdH",
        "<cmd>DiffviewFileHistory %<cr>",
        desc = "Git History",
      },
      {
        "<leader>gdc",
        "<cmd>DiffviewClose<cr>",
        desc = "Close Diffview",
      },
    },
  },
  {
    "pwntester/octo.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      -- OR 'ibhagwan/fzf-lua',
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("octo").setup({
        suppress_missing_scope = {
          projects_v2 = true,
        },
      })
    end,
    keys = {
      {
        "<leader>fo",
        "<cmd>Octo search<cr>",
        desc = "Find GitHub issues or PRs",
      },
      {
        "<leader>gio",
        "<cmd>Octo issue list<cr>",
        desc = "[l]ist Git Hub issues",
      },
      {
        "<leader>giC",
        "<cmd>Octo issue close<cr>",
        desc = "[C]lose issue",
      },
      {
        "<leader>gic",
        "<cmd>Octo issue create<cr>",
        desc = "[c]reate a new issue",
      },
      { "<leader>gpl", "<cmd>Octo pr list<cr>", desc = "[l]ist pull requests" },
      { "<leader>gpe", "<cmd>Octo pr edit<cr>", desc = "[e]dit pull requests" },
      {
        "<leader>gpc",
        "<cmd>Octo pr create<cr>",
        desc = "[c]create pull requests",
      },
      {
        "<leader>gpC",
        "<cmd>Octo pr close<cr>",
        desc = "[C]lose pull requests",
      },
      { "<leader>grs", "<cmd>Octo review start<cr>", desc = "[s]tart Review" },
      {
        "<leader>grS",
        "<cmd>Octo review submit<cr>",
        desc = "[S]ubmit review",
      },
      {
        "<leader>grr",
        "<cmd>Octo review resume<cr>",
        desc = "[r]esume review",
      },
      {
        "<leader>grd",
        "<cmd>Octo review discard<cr>",
        desc = "[d]iscard review",
      },
      {
        "<leader>grp",
        "<cmd>Octo review comments<cr>",
        desc = "View [p]ending Comments",
      },
    },
  },
}
