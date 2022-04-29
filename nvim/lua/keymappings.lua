local map = Utils.map;

map('n', ',<leader>', ':noh<CR>')
map('i', 'jk', '<Esc>')
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
map('n', '<leader>,', ':noh<CR>')

-- Tabs
map('n', '<S-t>', ':tabnew<CR>')
map('n', '<leader>tn', ':tabnew<CR>')
map('n', '<leader>to', ':tabonly<CR>')
map('n', '<leader>tc', ':tabclose<CR>')

-- Split
map('n', 's=', '<C-w>=')
map('n', 'sr', '<C-w>r')
map('n', 'sx', '<C-w>x')
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
map('v', 'J', ":m '>+1<CR>gv=gv")
map('v', 'K', ":m '<-2<CR>gv=gv")

-- 2 spaces down/up
map('n', '2o', 'o<CR>')
map('n', '2O', 'O<Esc>O')

map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')

-- Nvim Tree
map('n', '<leader>nn', ':Neotree toggle reveal<CR>')
map('n', '<leader>ff', ':Neotree reveal<CR>')

-- VIM WIKI
map('n', '<leader>vw', ':Telescope vimwiki<CR>')
map('n', '<leader>vg', ':Telescope vimwiki live_grep<CR>')

-- Zen mode
map('', '<leader>z', ':ZenMode<CR>')

-- FZF
map('n', '<leader>gg', ':Telescope git_files<CR>')
map('n', '<leader><leader>', ':Telescope find_files<CR>')
map('n', '<leader>hh', ':History<CR>')
map('n', '<leader>bb', ':Telescope buffers<CR>')
map('n', '<leader>s', ':Telescope live_grep<CR>')
map('n', '<leader>nm',  ':Telescope node_modules list<CR>')

-- ToggleTerm
map('n', '<leader>lg', ':lua Git:toggle()<CR>')
map('n', '<leader>sp', ':lua Spotify:toggle()<CR>')

-- PASTE W/O YANKING
map('v', 'p', '"_dP')

-- Plugins
map('i', '<C-k>', ':lua vim.lsp.buf.signature_help()<CR>')
map('n', 'gd', ':Telescope lsp_definitions<CR>')
map('n', 'K', ':lua vim.lsp.buf.hover()<CR>')
map('n', 'gi', ':Telescope lsp_implementations<CR>')
map('n', '<leader>D', ':Telescope lsp_type_definitions<CR>')
map('n', '<leader>rn', ':lua vim.lsp.buf.rename()<CR>')
map('n', '<leader>ca', ':lua vim.lsp.buf.code_action()<CR>')
map('v', '<leader>ca', ':lua vim.lsp.buf.range_code_action()<CR>')
map('n', 'gr', ':Telescope lsp_references<CR>')
map('n', '<leader>e', ':lua vim.diagnostic.open_float()<CR>')
map('n', '[d', ':lua vim.lsp.diagnostic.goto_prev()<CR>')
map('n', ']d', ':lua vim.lsp.diagnostic.goto_next()<CR>')
map('v', '<leader>cf', ':lua vim.lsp.buf.range_formatting()<CR>')
map('n', '<leader>cf', ':lua vim.lsp.buf.formatting_sync(nil, 10000)<CR>')
map('n', '<leader>pp', ':Telescope projects<CR>')


map('i', '<C-e>', 'copilot#Accept("<CR>")', { expr = true, script = true })
