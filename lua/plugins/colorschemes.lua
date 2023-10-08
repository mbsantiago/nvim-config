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
    priority = 1000,
    init = function()
      vim.cmd("colorscheme tender")
    end,
  },
  {
    "mcchrish/zenbones.nvim",
    name = "zenbones",
    requires = {
      "rktjmp/lush.nvim",
    },
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
    config = true,
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
}
