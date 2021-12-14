local ls = require('luasnip')
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

local function copy(args)
  return args[1]
end

ls.snippets = {
  javascript = {
    s("af", {
      f(copy, 2),
      t("const "),
      i(1),
      t(" = ("),
      i(2),
      t({ ") => " }),
      i(0),
    }),
  },
  typescriptreact = {
    s("rfc", {
      t({"import React from 'react';"}),
      -- Linebreak
      t({"type Props = {}", "\t"}),
      t("export const "),
      i(1),
      t({" = ({}: Props) => {", "\t"}),
      t("return (<>Hello</>)")
    })
  }
}

require("luasnip/loaders/from_vscode").lazy_load()
