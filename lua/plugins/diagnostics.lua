return {
    {
        "folke/trouble.nvim",
        dependencies = {
            "neovim/nvim-lspconfig",
            "nvim-tree/nvim-web-devicons",
        },
        opts = {
            icons = true,
            signs = {
                error = "",
                warning = "",
                hint = "",
                information = "",
                other = "﫠",
            },
        },
        lazy = true,
        event = "LspAttach",
        cmd = "TroubleToggle",
        keys = {
            {
                "<leader>lt",
                "<cmd>TroubleToggle document_diagnostics<cr>",
                desc = "Document Diagnostics",
            },
            {
                "<leader>lw",
                "<cmd>TroubleToggle workspace_diagnostics<cr>",
                desc = "Workspace Diagnostics",
            },
        },
    },
}
