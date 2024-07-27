local luasnip = safe_require("luasnip")

if not luasnip then
  return {}
end

local s = luasnip.snippet
local i = luasnip.insert_node
local fmt = require("luasnip.extras.fmt").fmt

return {
  s(
    "rb",
    fmt(
      [[
      ```{{r{1}}}
      {2}
      ```
      ]],
      { i(1), i(2) }
    )
  ),
}
