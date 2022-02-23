return function()
  local autopairs = safe_require("nvim-autopairs")

  if not autopairs then
    return
  end

  autopairs.setup({
    check_ts = false,
    enable_check_bracket_line = true,
    map_bs = false,
  })
end
