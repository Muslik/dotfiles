local status_ok, luasnip = pcall(require, 'luasnip')
if not status_ok then
  return
end

local s = luasnip.snippet
local t = luasnip.text_node
local i = luasnip.insert_node
local f = luasnip.function_node

local function copy(args)
  return args[1]
end

luasnip.snippets = {
  typescript = {
    s('acf', {
      t('const '),
      i(1, 'name'),
      t(' = async ('),
      i(2, 'args'),
      t({ ') => {', '\t' }),
      i(0),
      t({ '', '}' }),
    }),
    s('cf', {
      t('const '),
      i(1, 'name'),
      t(' = ('),
      i(2, 'args'),
      t({ ') => {', '\t' }),
      i(0),
      t({ '', '}' }),
    }),
  },
  typescriptreact = {
    s('acf', {
      t('const '),
      i(1, 'name'),
      t(' = async ('),
      i(2, 'args'),
      t({ ') => {', '\t' }),
      i(0),
      t({ '', '}' }),
    }),
    s('cf', {
      t('const '),
      i(1, 'name'),
      t(' = ('),
      i(2, 'args'),
      t({ ') => {', '\t' }),
      i(0),
      t({ '', '}' }),
    }),
    s('rfc', {
      t({ "import React from 'react';", '\t' }),
      t({ '', 'type Props = {}', '\t' }),
      t({ '', 'export const ' }),
      i(1, 'Component'),
      t({ ' = ({' }),
      i(2),
      t({ '}: Props) => {', '\t' }),
      i(3),
      t({ '', '\t' }),
      t('return <div>'),
      f(copy, 1),
      t('</div>', '\t'),
      t({ '', '}' }),
    }),
  },
}
