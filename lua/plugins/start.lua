return {
    {
        "glepnir/dashboard-nvim",
        event = "VimEnter",
        opts = {
            theme = "hyper",
            config = {
                week_header = {
                    enable = true,
                },
                shortcut = {
                    {
                        icon = "🔄 ",
                        desc = "Update",
                        group = "@property",
                        action = "Lazy update",
                        key = "u",
                    },
                    {
                        icon = "📒 ",
                        desc = "Explorer",
                        group = "@property",
                        action = "NvimTreeToggle",
                        key = "e",
                    },
                    {
                        icon = "📄 ",
                        icon_hl = "@variable",
                        desc = "Files",
                        group = "Label",
                        action = "Telescope find_files",
                        key = "f",
                    },
                    {
                        icon = "🔎 ",
                        desc = "Find text",
                        group = "DiagnosticHint",
                        action = "Telescope live_grep",
                        key = "t",
                    },
                    {
                        icon = "🧪 ",
                        desc = "Check health",
                        group = "Number",
                        action = "checkhealth",
                        key = "h",
                    },
                    {
                        icon = "🔴 ",
                        desc = "Quit",
                        group = "String",
                        action = "qa",
                        key = "q",
                    },
                },
                project = { limit = 5 },
                mru = { limit = 5, project = true },
            },
        },
        dependencies = { { "nvim-tree/nvim-web-devicons" } },
    },
}
