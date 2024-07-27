return {
  {
    dir = "/home/santiago/Software/plugins/neovim/m_taskwarrior_d.nvim",
    opts = {},
    keys = {
      {
        "<leader>pe",
        "<cmd>TWEditTask<cr>",
        desc = "TaskWarrior Edit",
      },
      {
        "<leader>pv",
        "<cmd>TWView<cr>",
        desc = "TaskWarrior View",
      },
      {
        "<leader>pu",
        "<cmd>TWUpdateCurrent<cr>",
        desc = "TaskWarrior Update Current",
      },
      {
        "<leader>ps",
        "<cmd>TWSyncTasks<cr>",
        desc = "TaskWarrior Sync Tasks",
      },
      {
        "<c-space>",
        "<cmd>TWToggle<cr>",
        desc = "TaskWarrior Toggle",
      },
    },
  },
}
