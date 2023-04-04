return {
  {
    "themercorp/themer.lua",
    lazy = false,
    config = function()
      local themer = require("themer")
      themer.setup({
        transparent = true,
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
    end,
  },
}
