local map = VimConfig.utils.map;

map('i', 'jj', '<Esc>')
-- Alternate way to save
map('n', '<leader>w', ':w<CR>')
-- Alternate way to quit
map('n', '<leader>q', ':q<CR>')

-- Better indenting
map('v', '<', '<gv')
map('v', '>', '>gv')

-- Treat long lines as break lines
map('', 'j', 'gj')
map('', 'k', 'gk')

-- Buffers
map('n', '<leader>bd', ':bd<CR>')
map('n', '<leader>bp', ':bp<CR>')
map('n', '<leader>bn', ':bn<CR>')
map('n', ',<leader>', ':noh<CR>')

-- Tabs
map('n', '<S-t>', ':tabnew<CR>')
map('n', '<leader>tn', ':tabnew<CR>')
map('n', '<leader>to', ':tabonly<CR>')
map('n', '<leader>tc', ':tabclose<CR>')
map('n', '<leader>tm', ':tabmove<CR>')

-- Split
map('n', 'ss', ':split<CR>')
map('n', 'sc', ':close<CR>')
map('n', 'sv', ':vsplit<CR>')

-- Switching windows
map('n', 'sj', '<C-w>j')
map('n', 'sk', '<C-w>k')
map('n', 'sh', '<C-w>h')
map('n', 'sl', '<C-w>l')

-- Resize windows
map('n', '<Up>', ':resize -2<CR>')
map('n', '<Down>', ':resize +2<CR>')
map('n', '<Left>', ':vertical resize -10<CR>')
map('n', '<Right>', ':vertical resize +10<CR>')

-- Move visual block
map('v', 'J', ':m+1<CR>gv=gv')
map('v', 'K', ':m-2<CR>gv=gv')

-- 2 spaces down/up
map('n', '2o', 'o<CR>')
map('n', '2O', 'O<Esc>O')

map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')

-- Nvim Tree
map('n', '<leader>n', ':NvimTreeToggle<CR>')
map('n', '<leader>tf', ':NvimTreeFocus<CR>')
map('n', '<leader>ff', ':NvimTreeFindFile<CR>')

-- Zen mode
map('', '<leader>z', ':Goyo<CR>')

-- FZF
map('n', '<space>g', ':GFiles<CR>')
map('n', '<space><space>', ':Files<CR>')
map('n', '<space>hh', ':Hist<CR>')
map('n', '<space>bb', ':Buffers<CR>')
map('n', '<space>s', ':Ag<CR>')

-- FTERM
map('n', '<C-t>', '<CMD>lua require("FTerm").toggle()<CR>')
map('t', '<C-t>', '<CMD>lua require("FTerm").toggle()<CR>')

-- LAZY GIT
map('n', '<leader>lg', ':LazyGit<CR>')

map('n', 'ca', '<cmd>lua vim.lsp.buf.code_action()<CR>')
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
map('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
map('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
map('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>')
map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
map('n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>')
map('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
map('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
map('v', '<leader>cf', '<cmd>lua vim.lsp.buf.range_formatting()<CR>')
map('n', '<leader>cf', '<cmd>lua vim.lsp.buf.formatting_sync(nil, 10000)<CR>')
map('n', '<leader>pp', ':Telescope projects<CR>')
map('n', '<Plug>Postman', ':tabnew .http<CR>')
