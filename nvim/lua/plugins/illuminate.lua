local map = require('utils').map

vim.g.Illuminate_ftblacklist = { 'dashboard', 'NvimTree', 'DressingSelect', 'neo-tree' }
map('n', '<a-n>', '<cmd>lua require"illuminate".next_reference{wrap=true}<cr>')
map('n', '<a-p>', '<cmd>lua require"illuminate".next_reference{reverse=true,wrap=true}<cr>')
