return function()
  local lualine = safe_require("lualine")

  if not lualine then
    return
  end

  local config = {
    options = {
      icons_enabled = true,
      theme = "auto",
      component_separators = "|",
      section_separators = { left = "", right = "" },
      disabled_filetypes = { "dashboard", "NvimTree", "packer" },
      always_divide_middle = true,
    },
    sections = {
      lualine_a = {
        { "mode", separator = { left = "" }, right_padding = 2 },
      },
      lualine_b = {
        "branch",
        "diff",
        { "diagnostics", sources = { "nvim_diagnostic" } },
      },
      lualine_c = {
        { "filename", path = 1 },
      },
      lualine_x = { "filetype" },
      lualine_y = { "progress" },
      lualine_z = {
        {
          "location",
          separator = { right = "" },
          left_padding = 2,
        },
      },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { "filename" },
      lualine_x = { "location" },
      lualine_y = {},
      lualine_z = {},
    },
    tabline = {},
    extensions = {},
  }

  local colors = {
    yellow = "#ECBE7B",
    cyan = "#008080",
    darkblue = "#081633",
    green = "#98be65",
    orange = "#FF8800",
    violet = "#a9a1e1",
    magenta = "#c678dd",
    blue = "#51afef",
    red = "#ec5f67",
  }

  -- Inserts a component in lualine_c at left section
  local function ins_left(component)
    table.insert(config.sections.lualine_c, component)
  end

  -- Inserts a component in lualine_x ot right section
  local function ins_right(component)
    table.insert(config.sections.lualine_x, component)
  end

  ins_left({
    "lsp_progress",
    colors = {
      percentage = colors.cyan,
      title = colors.cyan,
      message = colors.cyan,
      spinner = colors.cyan,
      lsp_client_name = colors.magenta,
      use = true,
    },
    separators = {
      component = " ",
      progress = " | ",
      message = {
        pre = "(",
        post = ")",
        commenced = "In Progress",
        completed = "Completed",
      },
      percentage = { pre = "", post = "%% " },
      title = { pre = "", post = ": " },
      lsp_client_name = { pre = "[", post = "]" },
      spinner = { pre = "", post = "" },
    },
    display_components = {
      "lsp_client_name",
      "spinner",
      { "title", "percentage", "message" },
    },
    timer = {
      progress_enddelay = 500,
      spinner = 1000,
      lsp_client_name_enddelay = 1000,
    },
    spinner_symbols = {
      "🌑 ",
      "🌒 ",
      "🌓 ",
      "🌔 ",
      "🌕 ",
      "🌖 ",
      "🌗 ",
      "🌘 ",
    },
  })

  lualine.setup(config)
end
