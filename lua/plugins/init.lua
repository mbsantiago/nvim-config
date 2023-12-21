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
        },
      },
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
    "folke/todo-comments.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = true,
  },
  -- {
  --   "stevearc/dressing.nvim",
  --   lazy = true,
  --   opts = {
  --     input = {
  --       border = "solid",
  --     },
  --     select = {
  --       border = "solid",
  --     },
  --   },
  --   init = function()
  --     ---@diagnostic disable-next-line: duplicate-set-field
  --     vim.ui.select = function(...)
  --       require("lazy").load({ plugins = { "dressing.nvim" } })
  --       return vim.ui.select(...)
  --     end
  --
  --     ---@diagnostic disable-next-line: duplicate-set-field
  --     vim.ui.input = function(...)
  --       require("lazy").load({ plugins = { "dressing.nvim" } })
  --       return vim.ui.input(...)
  --     end
  --   end,
  -- },
}
