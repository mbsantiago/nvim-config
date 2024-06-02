return {
    {
        "jay-babu/mason-null-ls.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "nvimtools/none-ls.nvim",
        },
        config = function()
            require("mason-null-ls").setup({
                ensure_installed = {
                    "stylua",
                    "prettierd",
                    "shfmt",
                    "actionlint",
                    "typstfmt",
                },
                automatic_installation = false,
                handlers = {},
            })
            require("null-ls").setup({
                sources = {},
            })
        end,
        lazy = true,
        event = "VeryLazy",
        keys = {
            {
                "<leader>lf",
                vim.lsp.buf.format,
                desc = "Format",
            },
        },
    },
}
