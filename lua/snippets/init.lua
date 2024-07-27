local M = {}

function M.load()
  local luasnip = safe_require("luasnip")

  if not luasnip then
    return
  end

  luasnip.snippets = {
    all = require("snippets.all"),
    tex = require("snippets.tex"),
    python = require("snippets.python"),
    rmd = require("snippets.rmarkdown"),
  }
end

return M
