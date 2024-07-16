return {
  {
    "folke/which-key.nvim",
    config = function()
      local wk = require("which-key")

      wk.setup({
        plugins = {
          marks = true,
          registers = true,
          spelling = {
            enabled = false,
            suggestions = 20,
          },
        },
        show_help = true,
        triggers = "auto",
      })

      wk.add({
        { "<leader>T", group = "Terminal", nowait = true, remap = false },
        { "<leader>b", group = "Buffers", nowait = true, remap = false },
        { "<leader>c", group = "Code", nowait = true, remap = false },
        { "<leader>cr", group = "Refactor", nowait = true, remap = false },
        { "<leader>d", group = "Debug", nowait = true, remap = false },
        { "<leader>f", group = "Find", nowait = true, remap = false },
        { "<leader>g", group = "Git", nowait = true, remap = false },
        { "<leader>gf", group = "Find", nowait = true, remap = false },
        { "<leader>j", group = "Jump", nowait = true, remap = false },
        { "<leader>l", group = "LSP", nowait = true, remap = false },
        { "<leader>m", group = "Move", nowait = true, remap = false },
        { "<leader>n", group = "Notes", nowait = true, remap = false },
        { "<leader>nf", group = "Find", nowait = true, remap = false },
        { "<leader>nn", group = "New", nowait = true, remap = false },
        { "<leader>o", group = "Octo (GitHub)", nowait = true, remap = false },
        { "<leader>r", group = "Run", nowait = true, remap = false },
        { "<leader>s", group = "Select", nowait = true, remap = false },
        { "<leader>sn", group = "Node", nowait = true, remap = false },
        { "<leader>t", group = "Test", nowait = true, remap = false },
        { "<leader>u", group = "UI", nowait = true, remap = false },
        { "<leader>w", group = "Writing", nowait = true, remap = false },
        { "<leader>wl", group = "Latex", nowait = true, remap = false },
        {
          mode = { "v" },
          { "<leader>s", group = "Select", nowait = true, remap = false },
          { "<leader>sd", group = "Decrement", nowait = true, remap = false },
          { "<leader>si", group = "Increment", nowait = true, remap = false },
          { "<leader>ss", group = "Scope", nowait = true, remap = false },
        },
      })

      -- Register normal mappings
      -- local normal_mappings = {
      --   l = { name = "LSP" },
      --   f = { name = "Find" },
      --   t = { name = "Test" },
      --   r = { name = "Run" },
      --   g = { name = "Git", f = { name = "Find" } },
      --   b = { name = "Buffers" },
      --   d = { name = "Debug" },
      --   o = { name = "Octo (GitHub)" },
      --   w = {
      --     name = "Writing",
      --     l = { name = "Latex" },
      --   },
      --   n = {
      --     name = "Notes",
      --     f = { name = "Find" },
      --     n = { name = "New" },
      --   },
      --   T = { name = "Terminal" },
      --   u = { name = "UI" },
      --   j = { name = "Jump" },
      --   m = { name = "Move" },
      --   c = { name = "Code", r = { name = "Refactor" } },
      --   s = {
      --     name = "Select",
      --     n = { name = "Node" },
      --   },
      -- }
      --
      -- which_key.register(normal_mappings, {
      --   mode = "n",
      --   buffer = nil,
      --   silent = true,
      --   noremap = true,
      --   nowait = true,
      --   prefix = "<leader>",
      -- })

      -- Register visual mappings
      -- local visual_mappings = {
      --   s = {
      --     name = "Select",
      --     i = { name = "Increment", mode = "v" },
      --     d = { name = "Decrement", mode = "v" },
      --     s = { name = "Scope", mode = "v" },
      --   },
      -- }
      -- which_key.register(visual_mappings, {
      --   mode = "v",
      --   buffer = nil,
      --   silent = true,
      --   noremap = true,
      --   nowait = true,
      --   prefix = "<leader>",
      -- })
    end,
  },
}
