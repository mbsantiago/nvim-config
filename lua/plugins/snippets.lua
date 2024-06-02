return {
    { -- Snippets
        "L3MON4D3/LuaSnip",
        dependencies = {
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",
            "hrsh7th/nvim-cmp",
        },
        lazy = true,
        event = "InsertEnter",
        config = function()
            local luasnip = require("luasnip")

            local termcodes = function(str)
                return vim.api.nvim_replace_termcodes(str, true, true, true)
            end

            local check_back_space = function()
                local col = vim.fn.col(".") - 1
                if
                    col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
                then
                    return true
                else
                    return false
                end
            end

            local cmp = require("cmp")

            -- TODO: Check that this is the desired behavior
            _G.tab_complete = function()
                if cmp and cmp.visible() then
                    cmp.select_next_item()
                elseif luasnip and luasnip.expand_or_jumpable() then
                    return termcodes("<Plug>luasnip-expand-or-jump")
                elseif check_back_space() then
                    return termcodes("<Tab>")
                else
                    cmp.complete()
                end
                return ""
            end

            -- Custom snippets
            require("snippets").load()

            -- Load snippets from plugins
            require("luasnip.loaders.from_vscode").load()

            -- Load snippets from snippets/ directory with snipmate format
            require("luasnip.loaders.from_snipmate").load()
        end,
    },
    {
        "evesdropper/luasnip-latex-snippets.nvim",
        lazy = true,
        ft = "tex",
    },
    {
        "mattn/emmet-vim",
        ft = {
            "html",
            "css",
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
            "vue",
            "svelte",
            "markdown",
        },
        lazy = true,
    },
}
