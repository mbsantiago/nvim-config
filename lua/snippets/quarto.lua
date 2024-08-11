local luasnip = safe_require("luasnip")

if not luasnip then
  return {}
end

local s = luasnip.snippet
local c = luasnip.choice_node
local i = luasnip.insert_node
local t = luasnip.text_node
local fmt = require("luasnip.extras.fmt").fmt

return {
  s(
    { trig = "cb", name = "code block", dscr = "Code block" },
    fmt(
      [[
      ```{<>}
      <>
      ```
      <>
      ]],
      {
        c(1, {
          t("python"),
          t("r"),
          t("javascript"),
          t("lua"),
        }),
        i(2),
        i(3),
      },
      { delimiters = "<>" }
    )
  ),
}
