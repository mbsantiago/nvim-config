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
            "aznhe21/actions-preview.nvim",
            "b0o/schemastore.nvim",
        },
        config = function()
            -- Setup capabilities (completion and snippets)
            local capabilities = vim.tbl_deep_extend(
                "force",
                {
                    textDocument = {
                        foldingRange = {
                            dynamicRegistration = false,
                            lineFoldingOnly = true,
                        },
                    },
                },
                vim.lsp.protocol.make_client_capabilities(),
                require("cmp_nvim_lsp").default_capabilities()
            )

            local lspconfig = require("lspconfig")

            -- Configure LSPs
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" },
                        },
                    },
                },
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
            lspconfig.groovyls.setup({
                capabilities = capabilities,
                cmd = { "groovy-language-server" },
                root_dir = function(fname)
                    return vim.fn.getcwd()
                end,
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
                    json = {
                        schemas = require("schemastore").json.schemas(),
                        validate = { enable = true },
                    },
                },
            })
            lspconfig.yamlls.setup({
                capabilities = capabilities,
                settings = {
                    yaml = {
                        schemaStore = {
                            enable = false,
                            url = "",
                        },
                        schemas = require("schemastore").yaml.schemas(),
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
}
