local ls = require('luasnip')
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

local function copy(args)
  return args[1]
end

ls.snippets = {
  typescriptreact = {
    s("rfc", {
      t({ "import React from 'react';", "\t" }),
      t({ "", "type Props = {}", "\t" }),
      t({"", "export const "}),
      i(1, "Component"),
      t({ " = ({"}),
      i(2),
      t({"}: Props) => {", "\t" }),
      i(3),
      t({"", "\t"}),
      t("return <div>"),
      f(copy, 1),
      t("</div>", "\t"),
      t({ "", "}" }),
    })
  }
}

require("luasnip/loaders/from_vscode").lazy_load()
