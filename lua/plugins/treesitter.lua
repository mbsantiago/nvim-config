return {
  { -- Treesiter
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "nvim-treesitter/playground",
      "JoosepAlviste/nvim-ts-context-commentstring",
      "nvim-treesitter/nvim-treesitter-textobjects",
      "RRethy/nvim-treesitter-textsubjects",
      "David-Kunz/treesitter-unit",
      "lewis6991/spellsitter.nvim",
    },
    config = function()
      local treesitter = require("nvim-treesitter.configs")

      treesitter.setup({
        highlight = {
          enable = true,
        },

        indent = {
          enable = true,
          disable = {
            "python", -- treesitter python indentation is shit
          },
        },

        -- TODO: Refactor as this belongs to nvim-ts-autotag
        autotag = { enable = true },

        -- TODO: Refactor as this belongs to nvim-ts-context-commentstring
        context_commentstring = { enable = true },

        -- TODO: Refactor as this belongs to nvim-treesitter-textsubjects
        textsubjects = {
          enable = true,
          prev_selection = ",", -- (Optional) keymap to select the previous selection
          keymaps = {
            ["."] = "textsubjects-smart",
            [";"] = "textsubjects-container-outer",
            ["i;"] = "textsubjects-container-inner",
          },
        },

        -- TODO: Refactor as this belongs to nvim-treesitter-textobjects
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
            disable = { "latex" },
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
            disable = { "latex" },
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
        },
      })
    end,
  },
  { -- HTML Autotag with Treesitter
    "windwp/nvim-ts-autotag",
    config = true,
  },
}
