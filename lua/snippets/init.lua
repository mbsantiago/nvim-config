local M = {}

function M.load()
  local luasnip = require("luasnip")

  if not luasnip then
    return
  end

  luasnip.add_snippets("quarto", require("snippets.quarto"))
  -- luasnip.snippets = {
  --   all = require("snippets.all"),
  --   tex = require("snippets.tex"),
  --   python = require("snippets.python"),
  --   rmd = require("snippets.rmarkdown"),
  --   quarto = require("snippets.quarto"),
  -- }
end

return M
