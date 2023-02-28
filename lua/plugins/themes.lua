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
        colorscheme = "everforest",
        styles = {
          ["function"] = { style = "italic" },
          functionbuiltin = { style = "italic" },
          variable = { style = "italic" },
          variableBuiltIn = { style = "italic" },
          parameter = { style = "italic" },
        },
      })
      local telescope = require("telescope")
      telescope.load_extension("themes")
    end,
  },
}
