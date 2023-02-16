return function()
  local cursorline = safe_require("nvim-cursorline")

  if not cursorline then
    return
  end

  cursorline.setup({
    cursorline = {
      enable = true,
      timeout = 1000,
      number = false,
    },
    cursorword = {
      enable = true,
      min_length = 3,
      hl = { underline = true },
    },
  })
end
