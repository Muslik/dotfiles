local status_ok, which_key = pcall(require, 'which-key')
if not status_ok then
  return
end

local setup = {
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = false, -- adds help for motions
      text_objects = false, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = false, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  -- operators = { gc = "Comments" },
  icons = {
    breadcrumb = '»', -- symbol used in the command line area that shows your active key combo
    separator = '➜ ', -- symbol used between a key and it's label
    group = '+', -- symbol prepended to a group
  },
  keys = {
    scroll_down = '<c-d>', -- binding to scroll down inside the popup
    scroll_up = '<c-u>', -- binding to scroll up inside the popup
  },
  wi = {
    border = 'rounded', -- none, single, double, shadow
    position = 'bottom', -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0,
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = 'center', -- align columns left, center or right
  },
  show_help = false, -- show help message on the command line when the popup is visible
  trigers = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { 'j', 'k' },
    v = { 'j', 'k' },
  },
}

local mappings = {
  { '<leader>;t', group = 'Neotest' },
  { '<leader>;tt', "<cmd>lua require('neotest').run.run({ vim.fn.expand('%'), vitestCommand = 'npx vitest -w' })<cr>", desc = 'Run file' },
  { '<leader>;tr', "<cmd>lua require('neotest').run.run()<cr>", desc = 'Run nearest' },
  { '<leader>;tT', "<cmd>lua require('neotest').run.run(vim.loop.cwd())<cr>", desc = 'Run All Test file' },
  { '<leader>;tl', "<cmd>lua require('neotest').run.run_last()<cr>", desc = 'Run last' },
  { '<leader>;ts', "<cmd>lua require('neotest').summary.toggle()<cr>", desc = 'Toggle summary' },
  { '<leader>;to', "<cmd>lua require('neotest').output.open({ enter = true, auto_close = true })<cr>", desc = 'Toggle output panel' },
  { '<leader>;tO', "<cmd>lua require('neotest').output_panel.toggle()<cr>", desc = 'Toggle output panel' },
  { '<leader>;tS', "<cmd>lua require('neotest').run.stop()<cr>", desc = 'Stop' },

  { '<leader>B', group = 'Browse', nowait = true, remap = false },
  { '<leader>Bb', '<cmd>Telescope bookmarks<cr>', desc = 'Browser bookmarks', nowait = true, remap = false },
  { '<leader>Bd', '<cmd>BrowseDevdocsSearch<cr>', desc = 'Devdocs', nowait = true, remap = false },
  { '<leader>Bf', '<cmd>BrowseDevdocsFiletypeSearch<cr>', desc = 'Devdocs Filetype', nowait = true, remap = false },
  { '<leader>Bi', '<cmd>BrowseInputSearch<cr>', desc = 'Input Search', nowait = true, remap = false },
  { '<leader>Bm', '<cmd>BrowseMdnSearch<cr>', desc = 'Mdn', nowait = true, remap = false },
  { '<leader>T', group = 'Treesitter', nowait = true, remap = false },
  { '<leader>Tr', '<cmd>TSToggle rainbow<cr>', desc = 'Rainbow', nowait = true, remap = false },
  { '<leader>c', '<cmd>bdelete<CR>', desc = 'Close Buffer', nowait = true, remap = false },
  { '<leader>d', group = 'Debug', nowait = true, remap = false },
  { '<leader>dO', "<cmd>lua require'dap'.step_out()<cr>", desc = 'Out', nowait = true, remap = false },
  { '<leader>db', "<cmd>lua require'dap'.toggle_breakpoint()<cr>", desc = 'Breakpoint', nowait = true, remap = false },
  { '<leader>dc', "<cmd>lua require'dap'.continue()<cr>", desc = 'Continue', nowait = true, remap = false },
  { '<leader>di', "<cmd>lua require'dap'.step_into()<cr>", desc = 'Into', nowait = true, remap = false },
  { '<leader>dl', "<cmd>lua require'dap'.run_last()<cr>", desc = 'Last', nowait = true, remap = false },
  { '<leader>do', "<cmd>lua require'dap'.step_over()<cr>", desc = 'Over', nowait = true, remap = false },
  { '<leader>dr', "<cmd>lua require'dap'.repl.toggle()<cr>", desc = 'Repl', nowait = true, remap = false },
  { '<leader>du', "<cmd>lua require'dapui'.toggle()<cr>", desc = 'UI', nowait = true, remap = false },
  { '<leader>dx', "<cmd>lua require'dap'.terminate()<cr>", desc = 'Exit', nowait = true, remap = false },
  { '<leader>e', group = 'Edit', nowait = true, remap = false },
  { '<leader>ec', '<cmd>cd ~/dotfiles | edit $MYVIMRC<cr>', desc = 'Edit nvim config', nowait = true, remap = false },
  { '<leader>f', group = 'Find', nowait = true, remap = false },
  { '<leader>fC', '<cmd>Telescope commands<cr>', desc = 'Commands', nowait = true, remap = false },
  { '<leader>fM', '<cmd>Telescope man_pages<cr>', desc = 'Man Pages', nowait = true, remap = false },
  { '<leader>fR', '<cmd>Telescope registers<cr>', desc = 'Registers', nowait = true, remap = false },
  {
    '<leader>fT',
    '<cmd>lua require("telescope").extensions.live_grep_args.live_grep_args(require("telescope.themes").get_ivy())<cr>',
    desc = 'Find Text With Args',
    nowait = true,
    remap = false,
  },
  {
    '<leader>fb',
    '<cmd>lua require("telescope.builtin").buffers(require("telescope.themes").get_dropdown{previewer = false})<cr>',
    desc = 'Buffers',
    nowait = true,
    remap = false,
  },
  { '<leader>fc', '<cmd>Telescope colorscheme<cr>', desc = 'Colorscheme', nowait = true, remap = false },
  {
    '<leader>ff',
    "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{path_display = {'truncate'}, previewer = true})<cr>",
    desc = 'Find files',
    nowait = true,
    remap = false,
  },
  {
    '<leader>fg',
    "<cmd>lua require('telescope.builtin').git_files(require('telescope.themes').get_dropdown{path_display = {'full'}, previewer = false})<cr>",
    desc = 'Git find files',
    nowait = true,
    remap = false,
  },
  { '<leader>fh', '<cmd>Telescope help_tags<cr>', desc = 'Help', nowait = true, remap = false },
  { '<leader>fk', '<cmd>Telescope keymaps<cr>', desc = 'Keymaps', nowait = true, remap = false },
  { '<leader>fl', '<cmd>Telescope resume<cr>', desc = 'Last Search', nowait = true, remap = false },
  {
    '<leader>fn',
    '<cmd>lua require("telescope").extensions.node_modules.list(require("telescope.themes").get_dropdown({ previewer = false }))<cr>',
    desc = 'Node modules',
    nowait = true,
    remap = false,
  },
  { '<leader>fp', '<cmd>Telescope projects<cr>', desc = 'Projects', nowait = true, remap = false },
  { '<leader>fr', '<cmd>Telescope oldfiles<cr>', desc = 'Recent File', nowait = true, remap = false },
  { '<leader>ft', '<cmd>Telescope live_grep theme=ivy<cr>', desc = 'Find Text', nowait = true, remap = false },
  { '<leader>g', group = 'Git', nowait = true, remap = false },
  { '<leader>gG', group = 'Gist', nowait = true, remap = false },
  { '<leader>gGa', '<cmd>Gist -b -a<cr>', desc = 'Create Anon', nowait = true, remap = false },
  { '<leader>gGd', '<cmd>Gist -d<cr>', desc = 'Delete', nowait = true, remap = false },
  { '<leader>gGf', '<cmd>Gist -f<cr>', desc = 'Fork', nowait = true, remap = false },
  { '<leader>gGg', '<cmd>Gist -b<cr>', desc = 'Create', nowait = true, remap = false },
  { '<leader>gGl', '<cmd>Gist -l<cr>', desc = 'List', nowait = true, remap = false },
  { '<leader>gGp', '<cmd>Gist -b -p<cr>', desc = 'Create Private', nowait = true, remap = false },
  {
    '<leader>gR',
    "<cmd>lua require 'gitsigns'.reset_buffer()<cr>",
    desc = 'Reset Buffer',
    nowait = true,
    remap = false,
  },
  { '<leader>gb', '<cmd>Telescope git_branches<cr>', desc = 'Checkout branch', nowait = true, remap = false },
  { '<leader>gc', '<cmd>Telescope git_commits<cr>', desc = 'Checkout commit', nowait = true, remap = false },
  { '<leader>gd', '<cmd>Gitsigns diffthis HEAD<cr>', desc = 'Diff', nowait = true, remap = false },
  { '<leader>gj', "<cmd>lua require 'gitsigns'.next_hunk()<cr>", desc = 'Next Hunk', nowait = true, remap = false },
  { '<leader>gk', "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", desc = 'Prev Hunk', nowait = true, remap = false },
  { '<leader>gl', "<cmd>lua require 'gitsigns'.blame_line()<cr>", desc = 'Blame', nowait = true, remap = false },
  { '<leader>go', '<cmd>Telescope git_status<cr>', desc = 'Open changed file', nowait = true, remap = false },
  {
    '<leader>gp',
    "<cmd>lua require 'gitsigns'.preview_hunk()<cr>",
    desc = 'Preview Hunk',
    nowait = true,
    remap = false,
  },
  { '<leader>gr', "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", desc = 'Reset Hunk', nowait = true, remap = false },
  { '<leader>gs', "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", desc = 'Stage Hunk', nowait = true, remap = false },
  {
    '<leader>gu',
    "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
    desc = 'Undo Stage Hunk',
    nowait = true,
    remap = false,
  },
  { '<leader>h', '<cmd>nohlsearch<CR>', desc = 'No HL', nowait = true, remap = false },
  { '<leader>l', group = 'LSP', nowait = true, remap = false },
  { '<leader>lF', '<cmd>LspToggleAutoFormat<cr>', desc = 'Toggle Autoformat', nowait = true, remap = false },
  { '<leader>lI', '<cmd>Mason<cr>', desc = 'Installer Info', nowait = true, remap = false },
  { '<leader>lR', '<cmd>LspRestart<cr>', desc = 'Restart', nowait = true, remap = false },
  { '<leader>la', '<cmd>lua vim.lsp.buf.code_action()<cr>', desc = 'Code Action', nowait = true, remap = false },
  { '<leader>ld', '<cmd>Trouble diagnostics<cr>', desc = 'Diagnostics', nowait = true, remap = false },
  { '<leader>lf', '<cmd>lua vim.lsp.buf.format({ async = true })<cr>', desc = 'Format', nowait = true, remap = false },
  { '<leader>li', '<cmd>LspInfo<cr>', desc = 'Info', nowait = true, remap = false },
  {
    '<leader>lj',
    '<cmd>lua vim.diagnostic.goto_next({buffer=0})<CR>',
    desc = 'Next Diagnostic',
    nowait = true,
    remap = false,
  },
  {
    '<leader>lk',
    '<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>',
    desc = 'Prev Diagnostic',
    nowait = true,
    remap = false,
  },
  { '<leader>ll', '<cmd>lua vim.lsp.codelens.run()<cr>', desc = 'CodeLens Action', nowait = true, remap = false },
  { '<leader>lr', '<cmd>lua vim.lsp.buf.rename()<cr>', desc = 'Rename', nowait = true, remap = false },
  { '<leader>ls', '<cmd>SymbolsOutline<cr>', desc = 'Symbols Outline', nowait = true, remap = false },
  {
    '<leader>lt',
    '<cmd>lua require("utils").toggle_diagnostics()<cr>',
    desc = 'Toggle Diagnostics',
    nowait = true,
    remap = false,
  },
  { '<leader>n', '<cmd>Neotree toggle reveal<cr>', desc = 'Explorer', nowait = true, remap = false },
  { '<leader>p', group = 'Packer', nowait = true, remap = false },
  { '<leader>pS', '<cmd>PackerStatus<cr>', desc = 'Status', nowait = true, remap = false },
  { '<leader>pc', '<cmd>PackerCompile<cr>', desc = 'Compile', nowait = true, remap = false },
  { '<leader>pi', '<cmd>PackerInstall<cr>', desc = 'Install', nowait = true, remap = false },
  { '<leader>ps', '<cmd>PackerSync<cr>', desc = 'Sync', nowait = true, remap = false },
  { '<leader>pu', '<cmd>PackerUpdate<cr>', desc = 'Update', nowait = true, remap = false },
  { '<leader>q', '<cmd>q<CR>', desc = 'Quit', nowait = true, remap = false },
  { '<leader>r', group = 'Replace', nowait = true, remap = false },
  {
    '<leader>rf',
    "<cmd>lua require('spectre').open_file_search()<cr>",
    desc = 'Replace Buffer',
    nowait = true,
    remap = false,
  },
  { '<leader>rr', "<cmd>lua require('spectre').open()<cr>", desc = 'Replace', nowait = true, remap = false },
  {
    '<leader>rw',
    "<cmd>lua require('spectre').open_visual({select_word=true})<cr>",
    desc = 'Replace Word',
    nowait = true,
    remap = false,
  },
  { '<leader>t', group = 'Terminal', nowait = true, remap = false },
  { '<leader>t1', ':1ToggleTerm<cr>', desc = '1', nowait = true, remap = false },
  { '<leader>t2', ':2ToggleTerm<cr>', desc = '2', nowait = true, remap = false },
  { '<leader>t3', ':3ToggleTerm<cr>', desc = '3', nowait = true, remap = false },
  { '<leader>t4', ':4ToggleTerm<cr>', desc = '4', nowait = true, remap = false },
  { '<leader>tg', '<cmd>lua _GITUI_TOGGLE()<cr>', desc = 'GitUi', nowait = true, remap = false },
  { '<leader>th', '<cmd>lua _HTOP_TOGGLE()<cr>', desc = 'Htop', nowait = true, remap = false },
  { '<leader>tj', '<cmd>JsonF<cr>', desc = 'Format Json', nowait = true, remap = false },
  { '<leader>tn', '<cmd>lua _NODE_TOGGLE()<cr>', desc = 'Node', nowait = true, remap = false },
  { '<leader>tr', '<cmd>lua _RANGER()<cr>', desc = 'Ranger', nowait = true, remap = false },
  { '<leader>ts', '<cmd>lua _SPOTIFY()<cr>', desc = 'Spotify', nowait = true, remap = false },
  { '<leader>w', '<cmd>w<CR>', desc = 'Write', nowait = true, remap = false },
  { '<leader>z', '<cmd>ZenMode<cr>', desc = 'Zen', nowait = true, remap = false },
}

which_key.setup(setup)
which_key.add(mappings)
