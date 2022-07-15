local status_ok, hop = pcall(require, 'hop')
if not status_ok then
  return
end
hop.setup()

local map = require('utils').map

map('', 'z', ':HopWordCurrentLine<cr>', { silent = true })
map('', 'Z', ':HopPattern<cr>', { silent = true })

map(
  'o',
  'f',
  ":lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<CR>"
)
map(
  'o',
  'F',
  ":lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<CR>"
)
map(
  'o',
  't',
  ":lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })<CR>"
)
map(
  'o',
  'T',
  ":lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })<CR>"
)

map(
  'n',
  'f',
  ":lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<CR>"
)
map(
  'n',
  'F',
  ":lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<CR>"
)
map(
  'n',
  't',
  ":lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })<CR>"
)
map(
  'n',
  'T',
  ":lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })<CR>"
)
