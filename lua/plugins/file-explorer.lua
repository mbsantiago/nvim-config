return {
    {
        "stevearc/oil.nvim",
        config = true,
        opts = {
            default_file_explorer = true,
        },
        lazy = false,
        dependencies = { "nvim-tree/nvim-web-devicons" },
        keys = {
            {
                "<leader>e",
                "<CMD>Oil<CR>",
                desc = "Open parent directory",
            },
        },
    },
}
