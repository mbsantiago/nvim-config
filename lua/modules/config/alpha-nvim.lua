return function()
  local dashboard = require("alpha.themes.dashboard")

  math.randomseed(os.time())

  local function button(sc, txt, keybind, keybind_opts)
    local b = dashboard.button(sc, txt, keybind, keybind_opts)
    b.opts.hl = "Function"
    b.opts.hl_shortcut = "Type"
    return b
  end

  local function pick_color()
    local colors = { "String", "Identifier", "Keyword", "Number" }
    return colors[math.random(#colors)]
  end

  local function footer()
    local total_plugins = #vim.tbl_keys(packer_plugins)
    local datetime = os.date("%d-%m-%Y  %H:%M:%S")
    return total_plugins .. " plugins  " .. datetime
  end

  dashboard.section.header.val = {
    [[                                   __                ]],
    [[      ___     ___    ___   __  __ /\_\    ___ ___    ]],
    [[     / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
    [[    /\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
    [[    \ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
    [[     \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
  }
  dashboard.section.header.opts.hl = pick_color()

  dashboard.section.buttons.val = {
    button("e", "  New file", ":ene <BAR> startinsert <CR>"),
    button(
      "<leader>sr",
      "  Recently opened files",
      ":Telescope oldfiles<CR>"
    ),
    button(
      "<leader>f",
      "  Find file",
      "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>"
    ),
    button("<leader>F", "  Find word", ":Telescope live_grep<CR>"),
    button("<leader>e", "  File browser", ":NvimTreeOpen<CR>"),
    button("s", "  Open session"),
    button("<leader>pu", "  Update plugins", ":PackerUpdate<CR>"),
    button("q", "  Quit"),
  }

  dashboard.section.footer.val = footer()
  dashboard.section.footer.opts.hl = "Constant"

  require("alpha").setup(dashboard.opts)
end
