return {
    {
        "williamboman/mason.nvim",
        lazy = true,
        cmd = "Mason",
        opts = {
            PATH = "prepend",
            ui = {
                border = "rounded",
            },
        },
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "williamboman/mason.nvim",
        },
        config = true,
        lazy = true,
        event = "VeryLazy",
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/cmp-nvim-lsp",
            "jose-elias-alvarez/nvim-lsp-ts-utils",
            "folke/neodev.nvim",
            "folke/neoconf.nvim",
            "aznhe21/actions-preview.nvim",
        },
        config = function()
            -- Setup capabilities (completion and snippets)
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            capabilities.textDocument.foldingRange = {
                dynamicRegistration = false,
                lineFoldingOnly = true,
            }

            local lspconfig = require("lspconfig")

            -- Configure LSPs
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
            })
            lspconfig.tsserver.setup({
                capabilities = capabilities,
                on_attach = function(client, _)
                    local ts_utils = require("nvim-lsp-ts-utils")
                    ts_utils.setup({})
                    ts_utils.setup_client(client)
                end,
                flags = {
                    debounce_text_changes = 500,
                },
            })
            lspconfig.typst_lsp.setup({
                capabilities = capabilities,
            })
            lspconfig.pyright.setup({
                capabilities = capabilities,
                settings = {
                    disableLanguageServices = true,
                    disableOrganizeImports = true,
                    python = {
                        analysis = {
                            diagnosticMode = "workspace",
                        },
                    },
                },
            })
            lspconfig.ruff.setup({
                capabilities = capabilities,
            })
            lspconfig.eslint.setup({
                capabilities = capabilities,
            })
            lspconfig.tailwindcss.setup({
                capabilities = capabilities,
            })
            lspconfig.taplo.setup({
                capabilities = capabilities,
            })
            lspconfig.jsonls.setup({
                capabilities = capabilities,
                settings = {
                    pyright = {
                        python = {
                            analysis = {
                                diagnosticMode = "workspace",
                            },
                        },
                    },
                },
            })
            lspconfig.astro.setup({
                capabilities = capabilities,
            })
            lspconfig.docker_compose_language_service.setup({
                capabilities = capabilities,
            })
            lspconfig.bashls.setup({
                capabilities = capabilities,
            })
            lspconfig.texlab.setup({
                capabilities = capabilities,
            })
        end,
        keys = {
            {
                "<leader>ls",
                vim.lsp.buf.signature_help,
                desc = "Signature help",
            },
            {
                "<leader>la",
                function()
                    require("actions-preview").code_actions()
                end,
                desc = "Code Action",
            },
            {
                "<leader>lr",
                vim.lsp.buf.rename,
                desc = "Rename",
            },
            {
                "<leader>lF",
                vim.lsp.buf.references,
                desc = "Finder",
            },
            {
                "<leader>ld",
                vim.lsp.buf.definition,
                desc = "Go To Definition",
            },
            {
                "<leader>lD",
                vim.lsp.buf.declaration,
                desc = "Go To Declaration",
            },
            { "<leader>lh", vim.lsp.buf.hover, desc = "Hover Docs" },
            {
                "<leader>lj",
                vim.diagnostic.goto_next,
                desc = "Next Diagnostic",
            },
            {
                "<leader>lk",
                vim.diagnostic.goto_prev,
                desc = "Prev Diagnostic",
            },
        },
    },
    {
        "simrat39/rust-tools.nvim",
        config = true,
        lazy = true,
        ft = "rust",
    },
    {
        "folke/neoconf.nvim",
        opts = {
            plugins = {
                jsonls = {
                    enabled = true,
                    configured_servers_only = true,
                },
                lua_ls = {
                    enabled = true,
                },
            },
        },
        lazy = true,
        event = "VeryLazy",
        keys = {
            {
                "<leader>le",
                "<cmd>Neoconf global<cr>",
                desc = "Setup LSP",
            },
            {
                "<leader>lC",
                "<cmd>Neoconf lsp<cr>",
                desc = "LSP Configs",
            },
            {
                "<leader>li",
                "<cmd>LspInfo<cr>",
                desc = "LSP Info",
            },
        },
    },
    -- {
    --   "folke/neodev.nvim",
    --   opts = {
    --     library = { plugins = { "neotest", "nvim-dap-ui" }, types = true },
    --   },
    --   lazy = true,
    --   event = "VeryLazy",
    -- },
}
