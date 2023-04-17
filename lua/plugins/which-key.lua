-- TODO: Move keys closer to their plugins
return {
  {
    "folke/which-key.nvim",
    config = function()
      local which_key = require("which-key")

      local setup = {
        plugins = {
          marks = true,       -- shows a list of your marks on ' and `
          registers = true,   -- shows your registers on " in NORMAL or <C-r> in INSERT mode
          spelling = {
            enabled = false,  -- enabling this will show WhichKey when pressing z= to select spelling suggestions
            suggestions = 20, -- how many suggestions should be shown in the list?
          },
        },
        -- add operators that will trigger motion and text object completion
        -- to enable all native operators, set the preset / operators plugin above
        -- operators = {
        --   gc = "Comments",
        -- },
        ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
        hidden = {
          "<silent>",
          "<cmd>",
          "<Cmd>",
          "<CR>",
          "call",
          "lua",
          "^:",
          "^ ",
        },                 -- hide mapping boilerplate
        show_help = true,  -- show help message on the command line when the popup is visible
        triggers = "auto", -- automatically setup triggers
        triggers_blacklist = {
          -- list of mode / prefixes that should never be hooked by WhichKey
          -- this is mostly relevant for key maps that start with a native binding
          -- most people should not need to change this
          i = { "j", "k" },
          v = { "j", "k" },
        },
      }
      which_key.setup(setup)

      -- Register normal mappings
      local normal_mappings = {
        l = { name = "LSP" },
        f = { name = "Find" },
        t = { name = "Test" },
        r = { name = "Run" },
        g = { name = "Git", f = { name = "Find" } },
        b = { name = "Buffers" },
        d = { name = "Debug" },
        o = { name = "Octo (GitHub)" },
        w = {
          name = "Writing",
          l = { name = "Latex" },
        },
        n = { name = "Notes", f = { name = "Find" }, n = { name = "New" } },
        T = { name = "Terminal" },
        u = { name = "UI" },
        j = { name = "Jump" },
        m = { name = "Move" },
        c = { name = "Code", r = { name = "Refactor" } },
        s = {
          name = "Select",
          n = { name = "Node" },
        },
      }
      which_key.register(normal_mappings, {
        mode = "n",
        buffer = nil,
        silent = true,
        noremap = true,
        nowait = true,
        prefix = "<leader>",
      })

      -- Register visual mappings
      local visual_mappings = {
        s = {
          name = "Select",
          i = { name = "Increment", mode = "v" },
          d = { name = "Decrement", mode = "v" },
          s = { name = "Scope", mode = "v" },
        },
      }
      which_key.register(visual_mappings, {
        mode = "v",
        buffer = nil,
        silent = true,
        noremap = true,
        nowait = true,
        prefix = "<leader>",
      })
    end,
  },
}
