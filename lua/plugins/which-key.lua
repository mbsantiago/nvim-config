-- TODO: Move keys closer to their plugins
return {
  {
    "folke/which-key.nvim",
    config = function()
      local which_key = require("which-key")

      local setup = {
        plugins = {
          marks = true, -- shows a list of your marks on ' and `

          registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode

          spelling = {
            enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
            suggestions = 20, -- how many suggestions should be shown in the list?
          },
        },
        -- add operators that will trigger motion and text object completion
        -- to enable all native operators, set the preset / operators plugin above
        operators = {
          gc = "Comments",
        },
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
        }, -- hide mapping boilerplate
        show_help = true, -- show help message on the command line when the popup is visible
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

      local mappings = {
        l = { name = "LSP" },
        f = { name = "Find" },
        t = { name = "Test" },
        r = { name = "Run" },
        g = { name = "Git", f = { name = "Find" } },
        b = { name = "Buffers" },
        d = { name = "Debug" },
        w = { name = "Writing" },
        T = { name = "Terminal" },
        u = { name = "UI" },
        m = { name = "Move" },
      }

      -- Register normal mappings first
      local opts = {
        mode = "n", -- NORMAL mode
        buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
        silent = true, -- use `silent` when creating keymaps
        noremap = true, -- use `noremap` when creating keymaps
        nowait = true, -- use `nowait` when creating keymaps
        prefix = "<leader>",
      }

      which_key.register(mappings, opts)

      -- -- Register tab motions
      -- local other = {
      --   ["["] = {
      --     name = "Move Prev",
      --     a = { ":previous" },
      --     A = { ":first" },
      --     b = { ":bprevious" },
      --     B = { ":bfirst" },
      --     l = { ":lprevious" },
      --     L = { ":lfirst" },
      --     ["<C-L>"] = { ":lpfile" },
      --     q = { ":cprevious" },
      --     Q = { ":cfirst" },
      --     ["<C-Q>"] = { ":cpfile" },
      --     t = { ":tprevious" },
      --     T = { ":tfirst" },
      --     ["<C-T>"] = { ":ptprevious" },
      --     f = { "Previous File (Alphabetical Order)" },
      --     n = { "Previous Conflict Hunk" },
      --     ["<space>"] = { "Add Blank Line Above" },
      --     e = { "Exchange Line With Above" },
      --     o = {
      --       name = "Option Unset",
      --       b = { "Background" },
      --       c = { "Cursorline" },
      --       d = { "Diff" },
      --       h = { "Search Highlight" },
      --       i = { "Search Ignore Case" },
      --       l = { "Character list" },
      --       n = { "Numbers" },
      --       r = { "Relative Numbers" },
      --       u = { "Cursor Column" },
      --       v = { "Virtual Edit" },
      --       w = { "Wrap" },
      --       x = { "Crosshairs" },
      --       z = { "Spell" },
      --     },
      --
      --     ["xx"] = { "XML Encode" },
      --     ["uu"] = { "URL Encode" },
      --     ["yy"] = { "C String Encode" },
      --     ["CC"] = { "C String Encode" },
      --   },
      --
      --   ["]"] = {
      --     name = "Move Next",
      --     a = { ":next" },
      --     A = { ":last" },
      --     b = { ":bnext" },
      --     B = { ":blast" },
      --     l = { ":lnext" },
      --     L = { ":llast" },
      --     ["<C-L>"] = { ":lnfile" },
      --     q = { ":cnext" },
      --     Q = { ":clast" },
      --     ["<C-Q>"] = { ":cnfile" },
      --     t = { ":tnext" },
      --     T = { ":tlast" },
      --     ["<C-T>"] = { ":ptnext" },
      --     f = { "Next File (Alphabetical Order)" },
      --     n = { "Next Conflict Hunk" },
      --     ["<space>"] = { "Add Blank Line Bellow" },
      --     e = { "Exchange Line With Bellow" },
      --     o = {
      --       name = "Option Set",
      --       b = { "Background" },
      --       c = { "Cursorline" },
      --       d = { "Diff" },
      --       h = { "Search Highlight" },
      --       i = { "Search Ignore Case" },
      --       l = { "Character list" },
      --       n = { "Numbers" },
      --       r = { "Relative Numbers" },
      --       u = { "Cursor Column" },
      --       v = { "Virtual Edit" },
      --       w = { "Wrap" },
      --       x = { "Crosshairs" },
      --       z = { "Spell" },
      --     },
      --     ["xx"] = { "XML Decode" },
      --     ["uu"] = { "URL Decode" },
      --     ["yy"] = { "C String Decode" },
      --     ["CC"] = { "C String Decode" },
      --   },
      --
      --   ["<C-\\>"] = { "Toggle Terminal" },
      --   ["<C-Down>"] = { "Add Cursor Down" },
      --   ["<C-Up>"] = { "Add Cursor Up" },
      -- }
      --
      -- opts = {
      --   mode = "n", -- NORMAL mode.
      --   buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
      --   silent = true, -- use `silent` when creating keymaps
      --   noremap = true, -- use `noremap` when creating keymaps
      --   nowait = true, -- use `nowait` when creating keymaps
      -- }
      --
      -- which_key.register(other, opts)

      -- Local leader
      -- opts = {
      --   mode = "n", -- NORMAL mode
      --   buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
      --   silent = true, -- use `silent` when creating keymaps
      --   noremap = true, -- use `noremap` when creating keymaps
      --   nowait = true, -- use `nowait` when creating keymaps
      --   prefix = "<localleader>",
      -- }

      -- local plugin = {
      --   l = {
      --     name = "VimTeX",
      --     i = { "Info" },
      --     I = { "Full Info" },
      --     t = { "Open Table of Contents" },
      --     T = { "Toggle Table of Contents" },
      --     q = { "Log" },
      --     v = { "View" },
      --     r = { "Reverse Search" },
      --     l = { "Compile" },
      --     L = { "Compile Selected" },
      --     k = { "Stop" },
      --     K = { "Stop All" },
      --     e = { "Errors" },
      --     o = { "Compile Output" },
      --     g = { "Status" },
      --     G = { "Status All" },
      --     c = { "Clean" },
      --     C = { "Full Clean" },
      --     m = { "Insert Maps List" },
      --     x = { "Reload" },
      --     X = { "Reload State" },
      --     s = { "Toggle Main" },
      --     a = { "Context Menu" },
      --   },
      --   ["\\"] = {
      --     name = "Multi Cursor",
      --     ["/"] = { "Regex Search" },
      --     ["\\"] = { "Insert at cursor" },
      --     ["A"] = { "Select All" },
      --     gs = { "Go to last" },
      --   },
      -- }

      -- which_key.register(plugin, opts)

      -- local objects = {
      --   a = { name = "around" },
      --   i = { name = "inside" },
      --   ['a"'] = [[double quoted string]],
      --   ["a'"] = [[single quoted string]],
      --   ["a("] = [[same as ab]],
      --   ["a)"] = [[same as ab]],
      --   ["a<lt>"] = [[a <> from '<' to the matching '>']],
      --   ["a>"] = [[same as a<]],
      --   ["aB"] = [[a Block from [{ to ]} (with brackets)]],
      --   ["aW"] = [[a WORD (with white space)]],
      --   ["a["] = [[a [] from '[' to the matching ']']],
      --   ["a]"] = [[same as a[]],
      --   ["a`"] = [[string in backticks]],
      --   ["ab"] = [[a block from [( to ]) (with braces)]],
      --   ["ap"] = [[a paragraph (with white space)]],
      --   ["as"] = [[a sentence (with white space)]],
      --   ["at"] = [[a tag block (with white space)]],
      --   ["aw"] = [[a word (with white space)]],
      --   ["a{"] = [[same as aB]],
      --   ["a}"] = [[same as aB]],
      --   ['i"'] = [[double quoted string without the quotes]],
      --   ["i'"] = [[single quoted string without the quotes]],
      --   ["i("] = [[same as ib]],
      --   ["i)"] = [[same as ib]],
      --   ["i<lt>"] = [[inner <> from '<' to the matching '>']],
      --   ["i>"] = [[same as i<]],
      --   ["iB"] = [[inner Block from [{ and ]}]],
      --   ["iW"] = [[inner WORD]],
      --   ["i["] = [[inner [] from '[' to the matching ']']],
      --   ["i]"] = [[same as i[]],
      --   ["i`"] = [[string in backticks without the backticks]],
      --   ["ib"] = [[inner block from [( to ])]],
      --   ["ip"] = [[inner paragraph]],
      --   ["is"] = [[inner sentence]],
      --   ["it"] = [[inner tag block]],
      --   ["iw"] = [[inner word]],
      --   ["i{"] = [[same as iB]],
      --   ["if"] = [[inner function]],
      --   ["af"] = [[outer function]],
      --   ["ic"] = [[inner class]],
      --   ["ac"] = [[outer class]],
      --   ["ia"] = [[inner argument]],
      --   ["aa"] = [[outer argument]],
      --   ["ik"] = [[inner language block]],
      --   ["ak"] = [[outer language block]],
      --   ["iC"] = [[inner function call]],
      --   ["aC"] = [[outer function call]],
      --   ["iS"] = [[inner comment]],
      --   ["iu"] = [[inner unit]],
      --   ["au"] = [[outer unit]],
      -- }

      -- Text objects
      -- which_key.register(objects, { mode = "o", prefix = "" })
    end,
  },
}
