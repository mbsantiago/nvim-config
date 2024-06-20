return {
    {
        -- Treesiter
        "nvim-treesitter/nvim-treesitter",
        dependencies = {
            "JoosepAlviste/nvim-ts-context-commentstring",
            "nvim-treesitter/nvim-treesitter-textobjects",
            "RRethy/nvim-treesitter-textsubjects",
            "David-Kunz/treesitter-unit",
        },
        config = function()
            local treesitter = require("nvim-treesitter.configs")

            treesitter.setup({
                highlight = {
                    enable = true,
                    disable = {
                        "latex", -- NOTE: highlight syntax is provided by vimtex
                    },
                    additional_vim_regex_highlighting = false,
                },
                indent = {
                    enable = true,
                    disable = {
                        "python", -- treesitter python indentation is shit
                    },
                },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "<leader>sh",
                        node_incremental = "<leader>si",
                        scope_incremental = "<leader>ss",
                        node_decremental = "<leader>sd",
                    },
                },
                autotag = { enable = true },
                textsubjects = {
                    enable = true,
                    prev_selection = ",",
                    keymaps = {
                        ["."] = "textsubjects-smart",
                        [";"] = "textsubjects-container-outer",
                        ["i;"] = "textsubjects-container-inner",
                    },
                },
                textobjects = {
                    select = {
                        enable = true,
                        lookahead = true,
                        selection_modes = {
                            ["@parameter.outer"] = "v", -- charwise
                            ["@function.outer"] = "V", -- linewise
                            ["@class.outer"] = "<c-v>", -- blockwise
                        },
                        keymaps = {
                            -- Function
                            ["af"] = "@function.outer",
                            ["if"] = "@function.inner",
                            -- Assignment
                            ["ae"] = "@assignment.outer",
                            ["ie"] = "@assignment.inner",
                            ["gl"] = "@assignment.rhs",
                            ["gh"] = "@assignment.lhs",
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
                            -- Statement
                            ["as"] = "@statement.outer",
                        },
                    },
                    move = {
                        enable = true,
                        disable = { "latex" },
                        set_jumps = true, -- whether to set jumps in the jumplist
                        goto_next_start = {
                            ["]m"] = "@function.outer",
                            ["]]"] = "@class.outer",
                            ["]s"] = "@statement.outer",
                        },
                        goto_next_end = {
                            ["]M"] = "@function.outer",
                            ["]["] = "@class.outer",
                        },
                        goto_previous_start = {
                            ["[m"] = "@function.outer",
                            ["[["] = "@class.outer",
                            ["[s"] = "@statement.outer",
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
                            ["mpa"] = "@parameter.inner",
                        },
                        swap_previoums = {
                            ["mpA"] = "@parameter.inner",
                        },
                    },
                    lsp_interop = {
                        enable = true,
                        border = "none",
                        floating_preview_opts = {},
                        peek_definition_code = {
                            ["<leader>df"] = "@function.outer",
                            ["<leader>dF"] = "@class.outer",
                        },
                    },
                },
            })

            require("ts_context_commentstring").setup({
                enable_autocmd = false,
            })
        end,
    },
}
