return {
    {
        "stevearc/oil.nvim",
        config = true,
        opts = {
            default_file_explorer = true,
        },
        lazy = false,
        commit = "18272aba9d00a3176a5443d50dbb4464acc167bd",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        keys = {
            {
                "-",
                "<CMD>Oil<CR>",
                desc = "Open parent directory",
            },
        },
    },
}
