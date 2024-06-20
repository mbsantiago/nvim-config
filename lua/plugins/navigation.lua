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
    -- {
    --     "ThePrimeagen/harpoon",
    --     branch = "harpoon2",
    --     dependencies = { "nvim-lua/plenary.nvim" },
    --     config = function()
    --         require("harpoon").setup()
    --     end,
    --     keys = {
    --         {
    --             "<leader>mm",
    --             "<cmd>lua require('harpoon'):list():add()<cr>",
    --             desc = "Add Harpoon Mark",
    --         },
    --         {
    --             "<C-m>",
    --             "<cmd>lua require('harpoon').ui:toggle_quick_menu(require('harpoon'):list())<cr>",
    --             desc = "Toggle Harpoon Menu",
    --         },
    --         {
    --             "<leader>mp",
    --             "<cmd>lua require('harpoon'):list():prev()<cr>",
    --             desc = "Previous Harpoon Mark",
    --         },
    --         {
    --             "<leader>mn",
    --             "<cmd>lua require('harpoon'):list():next()<cr>",
    --             desc = "Next Harpoon Mark",
    --         },
    --         {
    --             "<leader>ma",
    --             "<cmd>lua require('harpoon'):list():select(1)<cr>",
    --             desc = "Go To First Harpoon Mark",
    --         },
    --         {
    --             "<leader>ms",
    --             "<cmd>lua require('harpoon'):list():select(2)<cr>",
    --             desc = "Go To Second Harpoon Mark",
    --         },
    --         {
    --             "<leader>md",
    --             "<cmd>lua require('harpoon'):list():select(3)<cr>",
    --             desc = "Go To Third Harpoon Mark",
    --         },
    --         {
    --             "<leader>mf",
    --             "<cmd>lua require('harpoon'):list():select(4)<cr>",
    --             desc = "Go To Fourth Harpoon Mark",
    --         },
    --     },
    -- },
}
