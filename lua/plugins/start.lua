return {
  -- { -- Start
  --   "goolord/alpha-nvim",
  --   lazy = false,
  --   config = function()
  --     local dashboard = require("alpha.themes.dashboard")
  --
  --     local winHeight = vim.fn.winheight(0)
  --     local buttonWidth = 40
  --
  --     local shortBanner = {}
  --
  --     local banner = {
  --       "        |_|_|",
  --       [[      \_|||;;_/]],
  --       [[     \d||%||%:b/               |_|_|]],
  --       [[    \d~|dO%|i::b/            \_|||;;_/]],
  --       [[  ._H||dSf|||%::H_.         \d|||||;:b/]],
  --       [[  ._H@|dLF|}|;::H_.        \d||#H#|;::b/]],
  --       "  ._H||dXFt||;.:H_.      ._H||#H#|||;::H_.",
  --       "  ._?|{|P|||/;:.P_.      ._H||#H#|||;::H_.",
  --       "   ._Hy||t|||;:H_.       ._H||#H#|||;::H_.",
  --       "   ._?|x||T|;i:P_.       ._?|||#||||;::P_.",
  --       "    ._H||i||;:H_.         ._H|||||||;:H_.",
  --       [[    ._H|"|||;:H_.         ._?||||||;::P_.]],
  --       " .=================.       ._H|||||;:H_.",
  --       " |;;|#H#|;;;;;;;;: |       ._H|||||;:H_.",
  --       " .=================.    .=================.",
  --       "  |;|#H#|;;;;;;;: |     |_________________|",
  --       "   |;|#H#|;;;;;: |       |               |",
  --       "   |;|#H#|;;;;;: |        |             |",
  --       "    |;|#H#|;;;: |         |             |",
  --       "    |;|#H#|;;;: |          |           |",
  --       "     |;|#H#|;: |           |           |",
  --       "      =========             |_________|",
  --     }
  --
  --     -- local banner = {
  --     --   ' Neovim ',
  --     -- }
  --     dashboard.section.header.val = banner
  --
  --     -- Menu
  --     dashboard.section.buttons.val = {
  --       dashboard.button("e", "󰈔 New file", ":ene <BAR> startinsert<CR>"),
  --       dashboard.button("r", "󱔗 Recent files", ":Telescope oldfiles <CR>"),
  --       dashboard.button("f", "󰱼 Find file", ":Telescope find_files<CR>"),
  --       dashboard.button("g", "󰺮 Find text", ":Telescope live_grep <CR>"),
  --       dashboard.button(
  --         "h",
  --         "󱤇 Find help tag",
  --         ":Telescope help_tags <CR>"
  --       ),
  --       dashboard.button(
  --         "s",
  --         " Settings",
  --         ":cd ~/.config/nvim/<CR> :Telescope find_files<CR>"
  --       ),
  --       dashboard.button("u", " Update plugins", ":Lazy<CR>"),
  --       dashboard.button("c", " Check health", ":checkhealth<CR>"),
  --       dashboard.button("q", " Quit", ":qa<CR>"),
  --     }
  --
  --     -- Extract footer information
  --     local function footer()
  --       local pluginStats = require("lazy").stats()
  --       local version = vim.version()
  --       local pluginCount = pluginStats["count"]
  --       local print_version = "v"
  --         .. version.major
  --         .. "."
  --         .. version.minor
  --         .. "."
  --         .. version.patch
  --       local date = os.date("%d.%m.%Y")
  --       --local datetime = os.date '%d.%m.%Y %H:%M'
  --       return " "
  --         .. print_version
  --         .. "   "
  --         .. pluginCount
  --         .. "   "
  --         .. date
  --     end
  --
  --     -- Set footer
  --     dashboard.section.footer.val = footer()
  --
  --     -- Colors
  --     -- defined in color theme (after/plugin/neosolarized.rc.lua)
  --     for _, button in ipairs(dashboard.section.buttons.val) do
  --       button.opts.width = buttonWidth
  --     end
  --
  --     -- Align dashboard vertically
  --     local function getDashboardHeight()
  --       local bannerHeight = 0
  --       for _ in pairs(dashboard.section.header.val) do
  --         bannerHeight = bannerHeight + 1
  --       end
  --       local buttonCount = 0
  --       for _ in pairs(dashboard.section.buttons.val) do
  --         buttonCount = buttonCount + 1
  --       end
  --       local buttonsHeight = 2 * buttonCount
  --       local footerHeight = 1
  --       local dashboardHeight = bannerHeight
  --         + dashboard.opts.layout[3].val
  --         + buttonsHeight
  --         + footerHeight
  --       return dashboardHeight
  --     end
  --
  --     -- Reduce dashboard size for small window heights
  --     if winHeight < getDashboardHeight() + 3 then
  --       dashboard.section.header.val = { "Neovim" }
  --       table.remove(dashboard.section.buttons.val, 5)
  --       table.remove(dashboard.section.buttons.val, 5)
  --       table.remove(dashboard.section.buttons.val, 5)
  --       table.remove(dashboard.section.buttons.val, 5)
  --     end
  --
  --     -- Set top margin
  --     local topSpace = vim.fn.max({
  --       0,
  --       vim.fn.floor((vim.fn.winheight(0) - getDashboardHeight()) / 2),
  --     })
  --     dashboard.opts.layout[1].val = topSpace
  --
  --     require("alpha").setup(dashboard.config)
  --   end,
  --   keys = {
  --     { "<leader>a", "<cmd>Alpha<cr>", desc = "Alpha" },
  --   },
  -- },
  {
    "glepnir/dashboard-nvim",
    event = "VimEnter",
    config = function()
      require("dashboard").setup({
        theme = "hyper",
        config = {
          week_header = {
            enable = true,
          },
          shortcut = {
            {
              desc = " Update",
              group = "@property",
              action = "Lazy update",
              key = "u",
            },
            {
              icon = " ",
              icon_hl = "@variable",
              desc = "Files",
              group = "Label",
              action = "Telescope find_files",
              key = "f",
            },
            {
              desc = " Apps",
              group = "DiagnosticHint",
              action = "Telescope app",
              key = "a",
            },
            {
              desc = " dotfiles",
              group = "Number",
              action = "Telescope dotfiles",
              key = "d",
            },
          },
        },
      })
    end,
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
  },
}
