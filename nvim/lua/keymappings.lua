local map = VimConfig.utils.map;

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
map('n', '<leader>nn', ':NvimTreeToggle<CR>')
map('n', '<leader>tf', ':NvimTreeFocus<CR>')
map('n', '<leader>ff', ':NvimTreeFindFile<CR>')

-- VIM WIKI
map('n', '<leader>vw', '<cmd>Telescope vimwiki<CR>')
map('n', '<leader>vg', '<cmd>Telescope vimwiki live_grep<CR>')

-- Zen mode
map('', '<leader>z', ':ZenMode<CR>')

-- FZF
map('n', '<leader>gg', ':GitFiles<CR>')
map('n', '<leader><leader>', ':Files<CR>')
map('n', '<leader>hh', ':History<CR>')
map('n', '<leader>bb', ':Buffer<CR>')
map('n', '<leader>s', ':Ag<CR>')

-- ToggleTerm
map('n', '<leader>lg', '<cmd>lua Git:toggle()<CR>')

-- PASTE W/O YANKING
map('v', 'p', '"_dP')

-- Plugins
-- map('n', '<leader>ns', '<cmd>PackageInfoShow<cr>')
-- map('n', '<leader>nd', '<cmd>PackageInfoDelete<cr>')
-- map('n', '<leader>np', '<cmd>PackageInfoChangeVersion<cr>')
-- map('n', '<leader>ni', '<cmd>PackageInfoInstall<cr>')
-- map('n', '<leader>nr', '<cmd>PackageInfoReinstall<cr>')

map('i', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
map('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
map('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
map('n', '<leader>ca', ':Telescope lsp_code_actions<CR>')
map('n', 'gr', ':Telescope lsp_references<CR>')
map('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>')
map('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
map('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
map('v', '<leader>cf', '<cmd>lua vim.lsp.buf.range_formatting()<CR>')
map('n', '<leader>cf', '<cmd>lua vim.lsp.buf.formatting_sync(nil, 10000)<CR>')
map('n', '<leader>pp', ':Telescope projects<CR>')
map('n', '<Plug>Postman', ':tabnew .http<CR>')


map('i', '<C-e>', 'copilot#Accept("<CR>")', { expr = true, script = true })
