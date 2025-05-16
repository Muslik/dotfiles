local map = Utils.map

vim.g.mapleader = ' '

map('i', 'jk', '<Esc>')

-- Better indenting
map('v', '<', '<gv')
map('v', '>', '>gv')

-- Treat long lines as break lines
map('', 'j', 'gj')
map('', 'k', 'gk')

-- Tabs
map('n', '<m-t>', '<cmd>tabnew<CR>')

-- Split
map('n', 's=', '<C-w>=')
map('n', 'sr', '<C-w>r')
map('n', 'sx', '<C-w>x')
map('n', 'ss', '<cmd>split<CR>')
map('n', 'sc', '<cmd>:bd<CR>')
map('n', 'sv', '<cmd>vsplit<CR>')

-- Switching windows
map('n', 'sj', '<C-w>j')
map('n', 'sk', '<C-w>k')
map('n', 'sh', '<C-w>h')
map('n', 'sl', '<C-w>l')

-- Resize windows
map('n', '<Up>', '<cmd>resize -2<CR>')
map('n', '<Down>', '<cmd>resize +2<CR>')
map('n', '<Left>', '<cmd>vertical resize -10<CR>')
map('n', '<Right>', '<cmd>vertical resize +10<CR>')

-- Move visual block
map('v', 'J', "<cmd>m '>+1<CR>gv=gv")
map('v', 'K', "<cmd>m '<-2<CR>gv=gv")

-- 2 spaces down/up
map('n', '2o', 'o<CR>')
map('n', '2O', 'O<Esc>O')

map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')

-- PASTE W/O YANKING
map('v', 'p', '"_dP')

-- Plugins
map('i', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
--[[ map('n', 'gtd', '<cmd>lua vim.lsp.buf.type_definition()<CR>') ]]
map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
map('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<CR>')
