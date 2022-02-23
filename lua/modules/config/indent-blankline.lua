return function()
  local indent_blankline = safe_require("indent_blankline")

  if not indent_blankline then
    return
  end

  indent_blankline.setup({
    buftype_exclude = { "terminal", "nofile" },
    char = "▏",
    filetype_exclude = {
      "help",
      "NvimTree",
      "dashboard",
      "packer",
      "TelescopePrompt",
      "alpha",
      "Trouble",
    },
    show_current_context = true,
    space_char_blankline = " ",
    use_treesitter = true,
    show_trailing_blankline_indent = false,
  })
end
