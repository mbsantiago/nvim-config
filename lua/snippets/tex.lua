local luasnip = safe_require("luasnip")

if not luasnip then
    return {}
end

local s = luasnip.snippet
local i = luasnip.insert_node
local t = luasnip.text_node
local l = require("luasnip.extras").lambda

return {
    s("bpar", {
        t("\\paragraph{"),
        i(1, "paragraph name"),
        t({ "}  % (start)", "" }),
        t("\\label{par:"),
        l(l._1:gsub(" ", "_"):lower(), 1),
        t({ "}", "" }),
        t({ "\\begin{pardescription}", "" }),
        t("\t\\item[Context:]"),
        i(2, " field domain"),
        t({ "", "" }),
        t("\t\\item[Content:]"),
        i(3, " what field knows"),
        t({ "", "" }),
        t("\t\\item[Conclusion:]"),
        i(4, " remaining gap"),
        t({ "", "" }),
        t({ "\\end{pardescription}", "" }),
        t("% paragraph "),
        l(l._1:gsub(" ", "_"):lower(), 1),
        t({ " (end)", "" }),
    }),
}
