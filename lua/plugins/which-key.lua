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
      })

      wk.add({
        { "<leader>T", group = "Terminal", nowait = true, remap = false },
        { "<leader>p", group = "Tasks", nowait = true, remap = false },
        { "<leader>b", group = "Buffers", nowait = true, remap = false },
        { "<leader>c", group = "Code", nowait = true, remap = false },
        { "<leader>cr", group = "Refactor", nowait = true, remap = false },
        { "<leader>d", group = "Debug", nowait = true, remap = false },
        { "<leader>f", group = "Find", nowait = true, remap = false },
        { "<leader>g", group = "Git", nowait = true, remap = false },
        { "<leader>gd", group = "Git Diff", nowait = true, remap = false },
        {
          "<leader>gi",
          group = "Git Hub Issues",
          nowait = true,
          remap = false,
        },
        {
          "<leader>gp",
          group = "Git Hub Pull Requests",
          nowait = true,
          remap = false,
        },
        {
          "<leader>gr",
          group = "Git Hub Reviews",
          nowait = true,
          remap = false,
        },
        { "<leader>gs", group = "Git Signs", nowait = true, remap = false },
        { "<leader>gf", group = "Git Find", nowait = true, remap = false },
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
    end,
  },
}
