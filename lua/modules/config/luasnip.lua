return function()
  local function prequire(...)
    local status, lib = pcall(require, ...)

    if status then
      return lib
    end

    return nil
  end

  local luasnip = prequire("luasnip")
  local cmp = prequire("cmp")

  local termcodes = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
  end

  local check_back_space = function()
    local col = vim.fn.col(".") - 1
    if col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
      return true
    else
      return false
    end
  end

  _G.tab_complete = function()
    if cmp and cmp.visible() then
      cmp.select_next_item()
    elseif luasnip and luasnip.expand_or_jumpable() then
      return termcodes("<Plug>luasnip-expand-or-jump")
    elseif check_back_space() then
      return termcodes("<Tab>")
    else
      cmp.complete()
    end
    return ""
  end

  _G.s_tab_complete = function()
    if cmp and cmp.visible() then
      cmp.select_prev_item()
    elseif luasnip and luasnip.jumpable(-1) then
      return termcodes("<Plug>luasnip-jump-prev")
    else
      return termcodes("<S-Tab>")
    end
    return ""
  end

  -- Custom snippets
  require("snippets").load()

  -- Load snippets from plugins
  require("luasnip.loaders.from_vscode").load()

  -- Load snippets from snippets/ directory with snipmate format
  require("luasnip.loaders.from_snipmate").load()
end
