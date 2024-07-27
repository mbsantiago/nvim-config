return {
  {
    "stevearc/dressing.nvim",
    opts = {},
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      require("notify").setup({
        background_colour = "#00000000",
      })

      require("noice").setup({
        messages = {
          view = "mini",
          view_warn = "mini",
        },
        notify = {
          view = "notify",
        },
        lsp = {
          progress = {
            enabled = true,
          },
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
          message = {
            view = "mini",
          },
        },
        presets = {
          bottom_search = false,
          command_palette = false,
          long_message_to_split = true,
          inc_rename = false,
          lsp_doc_border = true,
        },
        routes = {
          {
            filter = { find = "code_action" },
            opts = { skip = true },
          },
        },
      })
    end,
    lazy = false,
    keys = {
      {
        "<leader>um",
        "<CMD>Noice<CR>",
        desc = "View messages",
      },
    },
  },
  {
    "m4xshen/smartcolumn.nvim",
    opts = {
      disabled_filetypes = {
        "lazy",
        "mason",
        "help",
        "tex",
        "markdown",
        "text",
        "dashboard",
      },
    },
  },
}
