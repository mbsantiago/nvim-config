return function()
  local treesitter = safe_require("nvim-treesitter.configs")

  local parsers = safe_require("nvim-treesitter.parsers")

  if not treesitter or not parsers then
    return
  end

  local config = {
    ensure_installed = "all",

    sync_install = true,

    highlight = {
      enable = true, -- false will disable the whole extension
    },

    indent = { enable = false },

    rainbow = { enable = false },

    autotag = { enable = true },

    context_commentstring = { enable = true },

    textobjects = {
      select = {
        enable = true,

        disable = {
          "latex",
        },

        -- Automatically jump forward to textobj, similar to targets.vim
        lookahead = true,

        keymaps = {
          -- Function
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",

          -- Class
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",

          -- Function arguments
          ["aa"] = "@parameter.outer",
          ["ia"] = "@parameter.inner",

          -- Code block
          ["aB"] = "@block.outer",
          ["iB"] = "@block.inner",

          -- Function call
          ["aC"] = "@call.outer",
          ["iC"] = "@call.inner",

          -- String
          ["aS"] = "@comment.outer",
          ["iS"] = "@comment.inner",

          -- Loop
          ["al"] = "@loop.outer",
          ["il"] = "@loop.inner",

          -- Statement
          ["a="] = "@statement.outer",
        },
      },

      move = {
        enable = true,

        disable = {
          "latex",
        },

        set_jumps = true, -- whether to set jumps in the jumplist

        goto_next_start = {
          ["]m"] = "@function.outer",
          ["]]"] = "@class.outer",
        },

        goto_next_end = {
          ["]M"] = "@function.outer",
          ["]["] = "@class.outer",
        },

        goto_previous_start = {
          ["[m"] = "@function.outer",
          ["[["] = "@class.outer",
        },

        goto_previous_end = {
          ["[M"] = "@function.outer",
          ["[]"] = "@class.outer",
        },
      },

      swap = {
        enable = true,

        disable = {
          "latex",
        },

        swap_next = {
          ["<leader>a"] = "@parameter.inner",
        },

        swap_previous = {
          ["<leader>A"] = "@parameter.inner",
        },
      },
    },

    playground = {
      enable = true,

      disable = {},

      updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code

      persist_queries = false, -- Whether the query persists across vim sessions

      keybindings = {
        toggle_query_editor = "o",
        toggle_hl_groups = "i",
        toggle_injected_languages = "t",
        toggle_anonymous_nodes = "a",
        toggle_language_display = "I",
        focus_language = "f",
        unfocus_language = "F",
        update = "R",
        goto_node = "<cr>",
        show_help = "?",
      },
    },
  }

  treesitter.setup(config)
end
