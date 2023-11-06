return {
  {
    "olivercederborg/poimandres.nvim",
    lazy = false,
    config = function()
      require("poimandres").setup({})
    end,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require("rose-pine").setup({
        variant = "moon",
        dark_variant = "moon",
      })
    end,
    lazy = true,
  },
  {
    "folke/tokyonight.nvim",
    name = "tokyonight",
    config = true,
    lazy = true,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = true,
    lazy = true,
  },
  {
    "rebelot/kanagawa.nvim",
    name = "kanagawa",
    config = true,
    lazy = true,
  },
  {
    "ellisonleao/gruvbox.nvim",
    name = "gruvbox",
    config = true,
    lazy = true,
  },
  {
    "jacoborus/tender.vim",
    name = "tender",
    lazy = true,
  },
  {
    "rmehri01/onenord.nvim",
    name = "onenord",
    config = true,
    lazy = true,
  },
  {
    "AlexvZyl/nordic.nvim",
    name = "nordic",
    config = function()
      require("nordic").load()
    end,
    lazy = true,
  },
  {
    "Shatur/neovim-ayu",
    name = "ayu",
    opts = {
      mirage = true,
    },
    lazy = true,
  },
  {
    "marko-cerovac/material.nvim",
    config = function()
      require("material").setup({})
    end,
    name = "material",
    lazy = true,
  },
  {
    "navarasu/onedark.nvim",
    name = "onedark",
    config = function()
      require("onedark").setup({
        style = "warmer",
        lualine = {
          transparent = true,
        },
        code_style = {
          comments = "italic",
          functions = "bold",
          strings = "none",
          variables = "none",
        },
        diagnostics = {
          darker = true,
          undercurl = true,
          background = true,
        },
      })
    end,
    priority = 1000,
    init = function()
      vim.cmd("colorscheme onedark")
    end,
  },
}
