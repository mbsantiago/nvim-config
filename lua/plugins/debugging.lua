return {
    {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
            library = {
                "luvit-meta/library",
            },
        },
    },
    { "Bilal2453/luvit-meta", lazy = true },
    {
        "mfussenegger/nvim-dap",
        lazy = true,
        cmd = {
            "DapBreakpoint",
            "DapStopped",
            "DapContinue",
            "DapStepOver",
            "DapStepInto",
            "DapStepOut",
            "DapToggleRepl",
            "DapRunLast",
        },
        keys = {
            {
                "<leader>dc",
                "<cmd>lua require('dap').continue()<cr>",
                desc = "Debug Continue",
            },
            {
                "<leader>db",
                "<cmd>lua require('dap').toggle_breakpoint()<cr>",
                desc = "Debug Toggle Breakpoint",
            },
            {
                "<leader>dr",
                "<cmd>lua require('dap').repl.open()<cr>",
                desc = "Debug Open REPL",
            },
            {
                "<leader>dl",
                "<cmd>lua require('dap').run_last()<cr>",
                desc = "Debug Last Run",
            },
            {
                "<leader>dn",
                "<cmd>lua require('dap').step_over()<cr>",
                desc = "Debug Step Next",
            },
            {
                "<leader>di",
                "<cmd>lua require('dap').step_into()<cr>",
                desc = "Debug Step Into",
            },
            {
                "<leader>do",
                "<cmd>lua require('dap').step_out()<cr>",
                desc = "Debug Step Out",
            },
        },
    },
    {
        "mfussenegger/nvim-dap-python",
        dependencies = {
            "mfussenegger/nvim-dap",
        },
        ft = "python",
        lazy = true,
        config = function()
            local dap = require("dap")
            local dap_python = require("dap-python")
            dap_python.setup("python")
            table.insert(dap.configurations.python, {
                configurations = {
                    justMyCode = false,
                },
            })
            dap_python.test_runner = "pytest"
            dap_python.resolve_python = function()
                return "./venv/bin/python"
            end
        end,
        keys = {
            {
                "<leader>dm",
                "<cmd>lua require('dap-python').test_method()<cr>",
                desc = "Debug Test Method",
            },
            {
                "<leader>dk",
                "<cmd>lua require('dap-python').test_class()<cr>",
                desc = "Debug Test Class",
            },
            {
                "<leader>dv",
                "<cmd>lua require('dap-python').debug_selection()<cr>",
                desc = "Debug Selection",
            },
        },
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "mfussenegger/nvim-dap",
        },
        config = true,
        lazy = true,
        cmd = {
            "DapUI",
            "DapUIFloat",
            "DapUIVirtualText",
        },
        keys = {
            {
                "<leader>dt",
                "<cmd>lua require('dapui').toggle()<cr>",
                desc = "Debug Toggle UI",
            },
        },
    },
}
