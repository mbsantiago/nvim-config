return {
  {
    "themercorp/themer.lua",
    lazy = false,
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      local themer = require("themer")
      themer.setup({
        colorscheme = "catppuccin",
        styles = {
          ["function"] = { style = "italic" },
          functionbuiltin = { style = "italic" },
          variable = { style = "italic" },
          variableBuiltIn = { style = "italic" },
          parameter = { style = "italic" },
        },
        dim_inactive = false,
        enable_installer = true,
      })
      local telescope = require("telescope")
      telescope.load_extension("themes")
    end,
  },
}
