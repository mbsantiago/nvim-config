return function()
  themer = safe_require("themer")

  if not themer then
    return
  end

  themer.setup({
    colorscheme = "rose_pine", -- default colorscheme

    transparent = false,

    term_colors = true,

    dim_inactive = true,

    -- disable_telescope_themes = {},

    styles = { --   heading = {
      --     h1 = {},
      --     h2 = {},
      --   },
      ["function"] = { style = "italic" },
      functionbuiltin = { style = "italic" },
      --   ["function"] = {},
      --   functionBuiltIn = {},
      --   variable = {},
      --   variableBuiltIn = {},
      --   include = {},
      --   identifier = {},
      --   keyword = {},
      --   keywordBuiltIn = {},
      --   struct = {},
      --   string = {},
      --   parameter = {},
      --   field = {},
      --   type = {},
      --   typeBuiltIn = {},
      --   property = {},
      --   comment = {},
      --   punctuation = {},
      --   constructor = {},
      --   operator = {},
      --   constant = {},
      --   constantBuiltIn = {},
      --   todo = {},
      --   character = {},
      --   conditional = {},
      --   number = {},
      --   statement = {},
      --   uri = {},
      --   diagnostic = {
      --     underline = {
      --       error = {},
      --       warn = {},
      --       info = {},
      --       hint = {},
      --     },
      --     virtual_text = {
      --       error = {},
      --       warn = {},
      --       info = {},
      --       hint = {},
      --     },
      --   },
    },

    -- remaps = {
    --   palette = {},
    --   -- per colorscheme palette remaps, for example:
    --   -- remaps.palette = {
    --   --     rose_pine = {
    --   --     	fg = "#000000"
    --   --     }
    --   -- },
    --   -- remaps.highlights = {
    --   --     rose_pine = {
    --   --	base = {
    --   --     	  Normal = { bg = "#000000" }
    --   --	},
    --   --     }
    --   -- },
    --   --
    --   -- Also you can do remaps.highlights.globals  for global highlight remaps
    --   highlights = {},
    -- },

    -- langs = {
    --   html = true,
    --   md = true,
    -- },

    plugins = {
      treesitter = true,
      indentline = true,
      barbar = true,
      bufferline = true,
      cmp = true,
      gitsigns = true,
      lsp = true,
      telescope = true,
    },

    enable_installer = true, -- enable installer module
  })

  vim.cmd([[
    hi default NeotestPassed ctermfg=Green guifg=#96F291
    hi default NeotestFailed ctermfg=Red guifg=#F70067
    hi default NeotestRunning ctermfg=Yellow guifg=#FFEC63
    hi default NeotestSkipped ctermfg=Cyan guifg=#00f1f5
    hi link NeotestTest Normal 
    hi default NeotestNamespace ctermfg=Magenta guifg=#D484FF
    hi default NeotestFocused gui=bold,underline cterm=bold,underline
    hi default NeotestFile ctermfg=Cyan guifg=#00f1f5
    hi default NeotestDir ctermfg=Cyan guifg=#00f1f5
    hi default NeotestIndent ctermfg=Grey guifg=#8B8B8B
    hi default NeotestExpandMarker ctermfg=Grey guifg=#8094b4
    hi default NeotestAdapterName ctermfg=Red guifg=#F70067
  ]])


  local telescope = safe_require("telescope")

  if not telescope then
    return
  end

  telescope.load_extension("themes")
end
