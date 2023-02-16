return function()
  local which_key = safe_require("which-key")

  if not which_key then
    return
  end

  -- local legendary = safe_require("legendary")
  --
  -- if legendary then
  --   legendary.setup()
  -- end

  local setup = {
    plugins = {
      marks = true, -- shows a list of your marks on ' and `

      registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode

      spelling = {
        enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
        suggestions = 20, -- how many suggestions should be shown in the list?
      },

      -- the presets plugin, adds help for a bunch of default keybindings in Neovim
      -- No actual key bindings are created
      presets = {
        operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
        motions = true, -- adds help for motions
        text_objects = true, -- help for text objects triggered after entering an operator
        windows = true, -- default bindings on <c-w>
        nav = true, -- misc bindings to work with windows
        z = true, -- bindings for folds, spelling and others prefixed with z
        g = true, -- bindings for prefixed with g
      },
    },

    -- add operators that will trigger motion and text object completion
    -- to enable all native operators, set the preset / operators plugin above
    operators = {
      gc = "Comments",
      mo = { ":MagmaEvaluateOperator<cr>", "Magma Evaluate Operator" },
    },

    key_labels = {
      -- override the label used to display some keys. It doesn't effect WK in any other way.
      -- For example:
      -- ["<space>"] = "SPC",
      -- ["<cr>"] = "RET",
      -- ["<tab>"] = "TAB",
    },

    icons = {
      breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
      separator = "➜", -- symbol used between a key and it's label
      group = "+", -- symbol prepended to a group
    },

    popup_mappings = {
      scroll_down = "<c-d>", -- binding to scroll down inside the popup
      scroll_up = "<c-u>", -- binding to scroll up inside the popup
    },

    window = {
      border = "none", -- none, single, double, shadow
      position = "bottom", -- bottom, top
      margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
      padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
      winblend = 0,
    },

    layout = {
      height = { min = 4, max = 25 }, -- min and max height of the columns
      width = { min = 20, max = 50 }, -- min and max width of the columns
      spacing = 3, -- spacing between columns
      align = "left", -- align columns left, center or right
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
    ["a"] = { "<cmd>Alpha<cr>", "Alpha" },
    ["c"] = { "<cmd>bd<CR>", "Close Buffer" },
    ["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
    ["f"] = {
      "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
      "Find files",
    },
    ["F"] = { "<cmd>Telescope live_grep theme=ivy<cr>", "Find Text" },
    ["/"] = {
      "<cmd>Telescope current_buffer_fuzzy_find theme=ivy<cr>",
      "Find in Buffer",
    },
    ["P"] = {
      "<cmd>lua require('telescope').extensions.projects.projects()<cr>",
      "Projects",
    },

    d = {
      name = "Debug",
      c = { "<cmd>lua require('dap').continue()<cr>", "Continue" },
      b = {
        "<cmd>lua require('dap').toggle_breakpoint()<cr>",
        "Toggle Breakpoint",
      },
      r = { "<cmd>lua require('dap').repl.open()<cr>", "Open REPL" },
      l = { "<cmd>lua require('dap').run_last()<cr>", "Run Last" },
      n = { "<cmd>lua require('dap').step_over()<cr>", "Next" },
      i = { "<cmd>lua require('dap').step_into()<cr>", "Step Into" },
      o = { "<cmd>lua require('dap').step_out()<cr>", "Step Out" },
      m = {
        "<cmd>lua require('dap-python').test_method()<cr>",
        "Test Method",
      },
      k = { "<cmd>lua require('dap-python').test_class()<cr>", "Test Class" },
      v = {
        "<cmd>lua require('dap-python').debug_selection()<cr>",
        "Debug Selection",
      },
      t = { "<cmd>lua require('dapui').toggle()<cr>", "Toggle UI" },
    },

    v = {
      name = "View",
      c = { "<cmd>Telescope colorscheme<cr>", "Colorschemes" },
      t = { "<cmd>Telescope themes<cr>", "Themes" },
      z = { "<cmd>ZenMode<cr>", "Zen Mode" },
      w = { "<cmd>Twilight<cr>", "Toggle Twilight" },
    },

    w = {
      name = "Writing",
      t = { "<Plug>Translate<cr>", "Translate" },
      w = { "<Plug>TranslateW<cr>", "Translate Window" },
      r = { "<Plug>TranslateR<cr>", "Translate Replace" },
      x = { "<Plug>TranslateR<cr>", "Translate Cut" },
      s = { ":ThesaurusQueryReplaceCurrentWord<cr>", "Replace Thesaurus" },
      z = { ":Telescope spell_suggest<cr>", "Spelling Suggestions" },
    },

    p = {
      name = "Packer",
      c = { "<cmd>PackerCompile<cr>", "Compile" },
      i = { "<cmd>PackerInstall<cr>", "Install" },
      s = { "<cmd>PackerSync<cr>", "Sync" },
      S = { "<cmd>PackerStatus<cr>", "Status" },
      u = { "<cmd>PackerUpdate<cr>", "Update" },
    },

    g = {
      name = "Git",
      g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
      j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
      k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
      l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
      p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
      r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
      R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
      s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
      u = {
        "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
        "Undo Stage Hunk",
      },
      o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
      b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
      c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
      d = {
        "<cmd>Gitsigns diffthis HEAD<cr>",
        "Diff",
      },
    },

    l = {
      name = "LSP",
      a = { "<cmd>Lspsaga code_action<cr>", "Code Action" },
      d = {
        "<cmd>lua vim.lsp.buf.definition()<cr>",
        "Go To Definition",
      },
      w = {
        "<cmd>Telescope lsp_workspace_diagnostics<cr>",
        "Workspace Diagnostics",
      },
      f = { "<cmd>lua vim.lsp.buf.format({ async = true })<cr>", "Format" },
      F = { "<cmd>Lspsaga lsp_finder<cr>", "Finder" },
      i = { "<cmd>LspInfo<cr>", "Info" },
      I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
      h = { "<cmd>Lspsaga hover_doc<cr>", "Hover Docs" },
      H = { "<cmd>Lspsaga signature_help<cr>", "Signature Help" },
      p = { "<cmd>Lspsaga preview_definition<cr>", "Preview Definition" },
      c = {
        "<cmd>Lspsaga show_cursor_diagnostics<cr>",
        "Show Cursor Diagnostics",
      },
      L = {
        "<cmd>Lspsaga show_line_diagnostics<cr>",
        "Show Line Diagnostics",
      },
      j = {
        "<cmd>Lspsaga diagnostic_jump_next<CR>",
        "Next Diagnostic",
      },
      k = {
        "<cmd>Lspsaga diagnostic_jump_prev<cr>",
        "Prev Diagnostic",
      },
      K = {
        "<cmd>lua vim.lsp.client.stop()<cr>",
        "Kill LSP",
      },
      l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
      q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
      r = { "<cmd>Lspsaga rename<cr>", "Rename" },
      R = { "<cmd>Telescope lsp_references<cr>", "References" },
      s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
      S = {
        "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
        "Workspace Symbols",
      },
    },

    s = {
      name = "Search",
      B = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
      c = { "<cmd>Telescope themes<cr>", "Colorscheme" },
      h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
      M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
      r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
      f = { "<cmd>Telescope find_files<cr>", "Files" },
      b = { "<cmd>Telescope buffers<cr>", "Buffers" },
      R = { "<cmd>Telescope registers<cr>", "Registers" },
      m = { "<cmd>Telescope marks<cr>", "Marks" },
      t = { "<cmd>Telescope tags<cr>", "Tags" },
      T = { "<cmd>Telescope current_buffer_tags<cr>", "Tags in Buffer" },
      q = { "<cmd>Telescope quickfix<cr>", "Quickfix List" },
      l = { "<cmd>Telescope locfix<cr>", "Location List" },
      s = { "<cmd>Telescope search_history<cr>", "Search History" },
      d = {
        "<cmd>lua require'telescope.builtin'.find_files{ search_dirs = { '~/.config/nvim' } }<cr>",
        "Dot files",
      },
    },

    T = {
      name = "Terminal",
      n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },
      u = { "<cmd>lua _NCDU_TOGGLE()<cr>", "NCDU" },
      t = { "<cmd>lua _TASK_TOGGLE()<cr>", "Tasks" },
      m = { "<cmd>lua _HTOP_TOGGLE()<cr>", "Monitor" },
      p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" },
      f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
      h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
      v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
    },

    x = {
      name = "Trouble",
      x = { "<cmd>TroubleToggle<cr>", "Toggle" },
      w = {
        "<cmd>TroubleToggle workspace_diagnostics<cr>",
        "Workspace Diagnostics",
      },
      d = {
        "<cmd>TroubleToggle document_diagnostics<cr>",
        "Document Diagnostics",
      },
      q = { "<cmd>TroubleToggle quickfix<cr>", "Quickfix List" },
      l = { "<cmd>TroubleToggle loclist<cr>", "Location List" },
      r = { "<cmd>TroubleToggle lsp_references<cr>", "LSP References" },
    },

    ["<leader>"] = {
      name = "Hop",
      w = { "<cmd>HopWord<cr>", "Word" },
      p = { "<cmd>HopPattern<cr>", "Pattern" },
      l = { "<cmd>HopLine<cr>", "Line" },
      L = { "<cmd>HopLineStart<cr>", "Line Start" },
      c = { "<cmd>HopChar1<cr>", "Character" },
      C = { "<cmd>HopChar2<cr>", "Characters [2]" },
      a = { "<cmd>HopAnywhere<cr>", "Anywhere" },
    },

    r = {
      name = "Run",
      l = { "<Plug>SnipRun", "Run Line" },
      o = { "<Plug>SnipRunOperator", "Run Operator" },
      k = { "<cmd>SnipReset<cr>", "Reset" },
      c = { "<cmd>SnipClose<cr>", "Close" },
      f = { "<cmd>lua require('sniprun').run_file()<cr>", "File" },
      r = { "<cmd>RustRun<cr>", "Rust run" },
    },

    t = {
      name = "Tests",
      A = {
        "<cmd>lua require('neotest').run.run({ suite = true })<cr>",
        "Run All",
      },
      r = { "<cmd>lua require('neotest').run.run()<cr>", "Run Tests" },
      f = {
        "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>",
        "File Tests",
      },
      n = {
        "<cmd>lua require('neotest').run.run()<cr>",
        "Nearest Test",
      },
      l = { "<cmd>lua require('neotest').run.run_last()<cr>", "Last Test" },
      L = {
        "<cmd>lua require('neotest').run.run_last({ strategy = 'dap' })<cr>",
        "Debug Last Test",
      },
      j = { "<cmd>lua require('neotest').jump.next()<cr>", "Jump Next Test" },
      k = { "<cmd>lua require('neotest').jump.prev()<cr>", "Jump Prev Test" },
      s = {
        "<cmd>lua require('neotest').summary.toggle()<cr>",
        "Test Summary",
      },
      S = { "<cmd>lua require('neotest').run.stop()<cr>", "Stop Tests" },
      d = {
        "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>",
        "Debug Nearest Test",
      },
      D = {
        "<cmd>lua require('neotest').run.run({ vim.fn.expand('%'), strategy = 'dap' })<cr>",
        "Debug File",
      },
      a = {
        "<cmd>lua require('neotest').run.attach()<cr>",
        "Attach to Runner",
      },
      o = {
        "<cmd>lua require('neotest').output.open({ enter = true })<cr>",
        "Show Output",
      },
    },

    b = {
      name = "Bars",
      s = { "<cmd>SymbolsOutline<cr>", "Symbols" },
      e = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
      u = { "<cmd>UndotreeToggle<cr>", "Undo Tree" },
    },

    m = {
      name = "Magma",
      r = { "<cmd>MagmaEvaluateLine<cr>", "Evaluate Line" },
      i = { "<cmd>MagmaInit<cr>", "Initialize" },
      c = { "<cmd>MagmaReevaluateCell<cr>", "Reevaluate Cell" },
      d = { "<cmd>MagmaDelete<cr>", "Delete" },
      o = { "<cmd>MagmaShowOutput<cr>", "Show Output" },
    },
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

  -- Register tab motions
  local other = {
    ["<A-1>"] = { ":BufferLineGoToBuffer 1<CR>", "Go to buffer 1" },
    ["<A-2>"] = { ":BufferLineGoToBuffer 2<CR>", "Go to buffer 2" },
    ["<A-3>"] = { ":BufferLineGoToBuffer 3<CR>", "Go to buffer 3" },
    ["<A-4>"] = { ":BufferLineGoToBuffer 4<CR>", "Go to buffer 4" },
    ["<A-5>"] = { ":BufferLineGoToBuffer 5<CR>", "Go to buffer 5" },
    ["<A-6>"] = { ":BufferLineGoToBuffer 6<CR>", "Go to buffer 6" },
    ["<A-7>"] = { ":BufferLineGoToBuffer 7<CR>", "Go to buffer 7" },
    ["<A-8>"] = { ":BufferLineGoToBuffer 8<CR>", "Go to buffer 8" },
    ["<A-9>"] = { ":BufferLineGoToBuffer 9<CR>", "Go to buffer 9" },
    ["<A-b>"] = { ":BufferLinePick<CR>", "Pick Buffer" },
    ["<A-,>"] = { ":BufferLineCycleNext<CR>", "Next Buffer" },
    ["<A-.>"] = { ":BufferLineCyclePrev<CR>", "Previous Buffer" },
    ["<A->>"] = { ":BufferLineMoveNext<CR>", "Move Buffer Next" },
    ["<A-<>"] = { ":BufferLineMovePrev<CR>", "Move Buffer Prev" },
    ["<A-s>e"] = {
      ":BufferLineSortByExtension<CR>",
      "Sort Buffers by Extension",
    },
    ["<A-s>d"] = {
      ":BufferLineSortByDirectory<CR>",
      "Sort Buffers by Directory",
    },

    -- Adding labels to missing commands
    ["g"] = {
      name = "Go To",
      c = { "Code Comment" },
      b = { "Block Comment" },
    },

    ["["] = {
      name = "Move Prev",
      a = { ":previous" },
      A = { ":first" },
      b = { ":bprevious" },
      B = { ":bfirst" },
      l = { ":lprevious" },
      L = { ":lfirst" },
      ["<C-L>"] = { ":lpfile" },
      q = { ":cprevious" },
      Q = { ":cfirst" },
      ["<C-Q>"] = { ":cpfile" },
      t = { ":tprevious" },
      T = { ":tfirst" },
      ["<C-T>"] = { ":ptprevious" },
      f = { "Previous File (Alphabetical Order)" },
      n = { "Previous Conflict Hunk" },
      ["<space>"] = { "Add Blank Line Above" },
      e = { "Exchange Line With Above" },
      o = {
        name = "Option Unset",
        b = { "Background" },
        c = { "Cursorline" },
        d = { "Diff" },
        h = { "Search Highlight" },
        i = { "Search Ignore Case" },
        l = { "Character list" },
        n = { "Numbers" },
        r = { "Relative Numbers" },
        u = { "Cursor Column" },
        v = { "Virtual Edit" },
        w = { "Wrap" },
        x = { "Crosshairs" },
        z = { "Spell" },
      },

      ["xx"] = { "XML Encode" },
      ["uu"] = { "URL Encode" },
      ["yy"] = { "C String Encode" },
      ["CC"] = { "C String Encode" },
    },

    ["]"] = {
      name = "Move Next",
      a = { ":next" },
      A = { ":last" },
      b = { ":bnext" },
      B = { ":blast" },
      l = { ":lnext" },
      L = { ":llast" },
      ["<C-L>"] = { ":lnfile" },
      q = { ":cnext" },
      Q = { ":clast" },
      ["<C-Q>"] = { ":cnfile" },
      t = { ":tnext" },
      T = { ":tlast" },
      ["<C-T>"] = { ":ptnext" },
      f = { "Next File (Alphabetical Order)" },
      n = { "Next Conflict Hunk" },
      ["<space>"] = { "Add Blank Line Bellow" },
      e = { "Exchange Line With Bellow" },
      o = {
        name = "Option Set",
        b = { "Background" },
        c = { "Cursorline" },
        d = { "Diff" },
        h = { "Search Highlight" },
        i = { "Search Ignore Case" },
        l = { "Character list" },
        n = { "Numbers" },
        r = { "Relative Numbers" },
        u = { "Cursor Column" },
        v = { "Virtual Edit" },
        w = { "Wrap" },
        x = { "Crosshairs" },
        z = { "Spell" },
      },
      ["xx"] = { "XML Decode" },
      ["uu"] = { "URL Decode" },
      ["yy"] = { "C String Decode" },
      ["CC"] = { "C String Decode" },
    },

    ["<C-\\>"] = { "Toggle Terminal" },
    ["<C-Down>"] = { "Add Cursor Down" },
    ["<C-Up>"] = { "Add Cursor Up" },
  }

  opts = {
    mode = "n", -- NORMAL mode.
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
  }

  which_key.register(other, opts)

  local visual = {
    m = {
      name = "magma",
      r = { ":<C-u>MagmaEvaluateVisual<cr>", "Run Visual" },
    },
  }

  opts = {
    mode = "x", -- Visual mode.
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
  }
  which_key.register(visual, opts)

  -- Local leader
  opts = {
    mode = "n", -- NORMAL mode
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
    prefix = "<localleader>",
  }

  local plugin = {
    l = {
      name = "VimTeX",
      i = { "Info" },
      I = { "Full Info" },
      t = { "Open Table of Contents" },
      T = { "Toggle Table of Contents" },
      q = { "Log" },
      v = { "View" },
      r = { "Reverse Search" },
      l = { "Compile" },
      L = { "Compile Selected" },
      k = { "Stop" },
      K = { "Stop All" },
      e = { "Errors" },
      o = { "Compile Output" },
      g = { "Status" },
      G = { "Status All" },
      c = { "Clean" },
      C = { "Full Clean" },
      m = { "Insert Maps List" },
      x = { "Reload" },
      X = { "Reload State" },
      s = { "Toggle Main" },
      a = { "Context Menu" },
    },
    ["\\"] = {
      name = "Multi Cursor",
      ["/"] = { "Regex Search" },
      ["\\"] = { "Insert at cursor" },
      ["A"] = { "Select All" },
      gs = { "Go to last" },
    },
  }
  which_key.register(plugin, opts)

  -- Register text objects
  vim.api.nvim_set_keymap(
    "x",
    "iu",
    ':lua require"treesitter-unit".select()<CR>',
    { noremap = true }
  )
  vim.api.nvim_set_keymap(
    "x",
    "au",
    ':lua require"treesitter-unit".select(true)<CR>',
    { noremap = true }
  )
  vim.api.nvim_set_keymap(
    "o",
    "iu",
    ':<c-u>lua require"treesitter-unit".select()<CR>',
    { noremap = true }
  )
  vim.api.nvim_set_keymap(
    "o",
    "au",
    ':<c-u>lua require"treesitter-unit".select(true)<CR>',
    { noremap = true }
  )

  local objects = {
    a = { name = "around" },
    i = { name = "inside" },
    ['a"'] = [[double quoted string]],
    ["a'"] = [[single quoted string]],
    ["a("] = [[same as ab]],
    ["a)"] = [[same as ab]],
    ["a<lt>"] = [[a <> from '<' to the matching '>']],
    ["a>"] = [[same as a<]],
    ["aB"] = [[a Block from [{ to ]} (with brackets)]],
    ["aW"] = [[a WORD (with white space)]],
    ["a["] = [[a [] from '[' to the matching ']']],
    ["a]"] = [[same as a[]],
    ["a`"] = [[string in backticks]],
    ["ab"] = [[a block from [( to ]) (with braces)]],
    ["ap"] = [[a paragraph (with white space)]],
    ["as"] = [[a sentence (with white space)]],
    ["at"] = [[a tag block (with white space)]],
    ["aw"] = [[a word (with white space)]],
    ["a{"] = [[same as aB]],
    ["a}"] = [[same as aB]],
    ['i"'] = [[double quoted string without the quotes]],
    ["i'"] = [[single quoted string without the quotes]],
    ["i("] = [[same as ib]],
    ["i)"] = [[same as ib]],
    ["i<lt>"] = [[inner <> from '<' to the matching '>']],
    ["i>"] = [[same as i<]],
    ["iB"] = [[inner Block from [{ and ]}]],
    ["iW"] = [[inner WORD]],
    ["i["] = [[inner [] from '[' to the matching ']']],
    ["i]"] = [[same as i[]],
    ["i`"] = [[string in backticks without the backticks]],
    ["ib"] = [[inner block from [( to ])]],
    ["ip"] = [[inner paragraph]],
    ["is"] = [[inner sentence]],
    ["it"] = [[inner tag block]],
    ["iw"] = [[inner word]],
    ["i{"] = [[same as iB]],
    ["if"] = [[inner function]],
    ["af"] = [[outer function]],
    ["ic"] = [[inner class]],
    ["ac"] = [[outer class]],
    ["ia"] = [[inner argument]],
    ["aa"] = [[outer argument]],
    ["ik"] = [[inner language block]],
    ["ak"] = [[outer language block]],
    ["iC"] = [[inner function call]],
    ["aC"] = [[outer function call]],
    ["iS"] = [[inner comment]],
    ["iu"] = [[inner unit]],
    ["au"] = [[outer unit]],
  }
  -- Text objects
  which_key.register(objects, { mode = "o", prefix = "" })

  -- File Type Keybindings
  -- vim.cmd("autocmd FileType * lua SetFtKeybinds()")

  -- function SetFtKeybinds()
  --   local fileTy = vim.api.nvim_buf_get_option(0, "filetype")
  --
  --   if fileTy == "rmd" then
  --     which_key.register({
  --       ["r"] = {
  --         name = "Nvim-R",
  --         f = { "<plug>RStart", "Start R" },
  --         c = { "<plug>RCustomStart", "Custom Start R" },
  --         q = { "<plug>RClose", "Close R" },
  --         ["r"] = {
  --           name = "Commands",
  --           l = { "List Space" },
  --           r = { "Clear Console" },
  --           m = { "Remove Objects and Clear Console" },
  --           p = { "Print" },
  --           n = { "Names" },
  --           t = { "Structure" },
  --           a = { "Arguments" },
  --           e = { "Example" },
  --           h = { "Help" },
  --           s = { "Summary" },
  --           g = { "Plot" },
  --           b = { "Plot and Summary" },
  --           d = { "Set Working Directory" },
  --         },
  --         ["s"] = {
  --           name = "Run R Code",
  --           a = { "<plug>RSendFile", "Run File" },
  --         },
  --       },
  --     }, { prefix = "<localleader>", buffer = 0 })
  --   end
  -- end
end
