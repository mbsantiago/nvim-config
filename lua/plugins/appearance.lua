return {
  {
    -- Cursor line
    "yamatsum/nvim-cursorline",
    config = true,
  },
  {
    -- Indentation guide lines
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
      scope = {
        enabled = true,
      },
      indent = {
        char = "│",
      },
      exclude = {
        filetypes = {
          "help",
          "alpha",
          "dashboard",
          "neo-tree",
          "Trouble",
          "lazy",
        },
      },
    },
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    opts = {
      messages = {
        view = "mini",
        view_warn = "mini",
      },
      notify = {
        view = "mini",
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
        command_palette = true,
        long_message_to_split = true,
        inc_rename = false,
        lsp_doc_border = true,
      },
    },
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
        "NvimTree",
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
