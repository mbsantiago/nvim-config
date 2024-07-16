return {
    {
        "enddeadroyal/symbols-outline.nvim",
        lazy = true,
        opts = {
            autofold_depth = 2,
            auto_unfold_hover = true,
        },
        branch = "bugfix/symbol-hover-misplacement",
        cmd = "SymbolsOutline",
        keys = {
            {
                "<leader>lo",
                "<cmd>SymbolsOutline<cr>",
                desc = "Symbols Outline",
            },
        },
    },
}
