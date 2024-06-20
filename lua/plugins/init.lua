return {
    {
        -- Icons
        "nvim-tree/nvim-web-devicons",
    },
    {
        -- Comments
        "numToStr/Comment.nvim",
        dependencies = {
            "JoosepAlviste/nvim-ts-context-commentstring",
        },
        config = function()
            require("Comment").setup({
                pre_hook = require(
                    "ts_context_commentstring.integrations.comment_nvim"
                ).create_pre_hook(),
            })
        end,
    },
    {
        "kylechui/nvim-surround",
        config = true,
    },
    {
        "mbbill/undotree",
        cmd = "UndotreeToggle",
        lazy = true,
        keys = {
            { "<leader>U", "<cmd>UndotreeToggle<cr>", desc = "Undo Tree" },
        },
    },
    {
        "folke/todo-comments.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = true,
    },
}
