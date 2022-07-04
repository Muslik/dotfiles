local map = Utils.map

vim.g.mapleader = ' '

map('n', ',<leader>', '<cmd>noh<CR>')
map('i', 'jk', '<Esc>')
-- Alternate way to save
map('n', '<leader>w', '<cmd>w<CR>')
-- Alternate way to quit
map('n', '<leader>q', '<cmd>q<CR>')

-- Better indenting
map('v', '<', '<gv')
map('v', '>', '>gv')

-- Treat long lines as break lines
map('', 'j', 'gj')
map('', 'k', 'gk')

-- Buffers
map('n', '<leader>bd', '<cmd>bd<CR>')
map('n', '<leader>bp', '<cmd>bp<CR>')
map('n', '<leader>bn', '<cmd>bn<CR>')
map('n', '<leader>,', '<cmd>noh<CR>')

-- Tabs
map('n', '<S-t>', '<cmd>tabnew<CR>')

-- Split
map('n', 's=', '<C-w>=')
map('n', 'sr', '<C-w>r')
map('n', 'sx', '<C-w>x')
map('n', 'ss', '<cmd>split<CR>')
map('n', 'sc', '<cmd>close<CR>')
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

-- Nvim Tree
map('n', '<leader>nn', '<cmd>Neotree toggle reveal<CR>')
map('n', '<leader>ff', '<cmd>Neotree reveal<CR>')

-- VIM WIKI
map('n', '<leader>vw', '<cmd>Telescope vimwiki<CR>')
map('n', '<leader>vg', '<cmd>Telescope vimwiki live_grep<CR>')

-- Zen mode
map('', '<leader>z', '<cmd>ZenMode<CR>')

-- Telescope
map('n', '<leader>gg', '<cmd>Telescope git_files<CR>')
map('n', '<leader>gb', '<cmd>Telescope git_branches<CR>')
map('n', '<leader><leader>', '<cmd>Telescope find_files<CR>')
map('n', '<leader>bb', '<cmd>Telescope buffers<CR>')
map('n', '<leader>hh', '<cmd>Telescope oldfiles<CR>')
map('n', '<leader>s', '<cmd>Telescope live_grep<CR>')
map(
  'n',
  '<leader>S',
  '<cmd>lua require("telescope").extensions.live_grep_args.live_grep_args({ layout_strategy = "vertical", layout_config = { vertical = { height = 0.7, preview_height = 0.4 } }})<CR>'
)
map(
  'n',
  '<leader>nm',
  '<cmd>lua require("telescope").extensions.node_modules.list(require("telescope.themes").get_dropdown({ previewer = false }))<CR>'
)
map(
  'n',
  '<leader>pp',
  '<cmd>lua require("telescope").extensions.projects.projects(require("telescope.themes").get_dropdown({ previewer = false }))<CR>'
)

-- ToggleTerm
map('n', '<leader>tg', '<cmd>lua Git:toggle()<CR>')
map('n', '<leader>tm', '<cmd>lua Spotify:toggle()<CR>')
map('n', '<leader>tn', '<cmd>lua Node:toggle()<CR>')
map('n', '<leader>th', '<cmd>lua Htop:toggle()<CR>')

-- PASTE W/O YANKING
map('v', 'p', '"_dP')

-- Plugins
map('i', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
map('n', 'gd', '<cmd>Telescope lsp_definitions<CR>')
map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
map('n', 'gi', '<cmd>Telescope lsp_implementations<CR>')
map('n', '<leader>D', '<cmd>Telescope lsp_type_definitions<CR>')
map('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
map('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>')
map('v', '<leader>ca', '<cmd>lua vim.lsp.buf.range_code_action()<CR>')
map('n', 'gr', '<cmd>Telescope lsp_references<CR>')
map('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>')
map('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
map('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
map('v', '<leader>cf', '<cmd>lua vim.lsp.buf.range_formatting({ async = true })<CR>')
map('n', '<leader>cf', '<cmd>lua vim.lsp.buf.format({ async = true })<CR>')
