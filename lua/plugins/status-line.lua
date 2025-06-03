return {
  {
    -- Status line
    "nvim-lualine/lualine.nvim",
    lazy = false,
    config = function()
      require("lualine").setup({
        options = {
          theme = "onedark",
          component_separators = "|",
          section_separators = { left = "", right = "" },
          disabled_filetypes = {
            statusline = {
              "dashboard",
              "undotree",
              "neotest-summary",
              "lspsagaoutline",
              "DiffviewFiles",
            },
          },
        },
        sections = {
          lualine_a = {
            {
              "mode",
              separator = { left = "" },
              right_padding = 2,
            },
          },
          lualine_b = {
            "filename",
            {
              "branch",
            },
          },
          lualine_c = {
            {
              "diff",
              on_click = function()
                vim.cmd("DiffviewOpen HEAD -- %")
              end,
            },
          },
          lualine_x = {
            {
              "diagnostics",
              on_click = function()
                require("trouble").toggle("document_diagnostics")
              end,
            },
          },
          lualine_y = {
            "filetype",
          },
          lualine_z = {
            {
              "location",
              separator = { right = "" },
              left_padding = 2,
            },
          },
        },
        inactive_sections = {
          lualine_a = { "filename" },
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = { "filetype" },
        },
        tabline = {},
        extensions = {
          "lazy",
          "nvim-tree",
          "symbols-outline",
          "trouble",
          "toggleterm",
          "nvim-dap-ui",
          "quickfix",
          "man",
          {
            sections = { lualine_a = { "filetype" } },
            filetypes = { "noice" },
          },
        },
      })
    end,
  },
}
