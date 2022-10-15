local status_ok, toggleterm = pcall(require, 'toggleterm')
if not status_ok then
  return
end

toggleterm.setup({
  -- size can be a number or function which is passed the current terminal
  size = 20,
  open_mapping = [[<leader>tt]],
  direction = 'float',
  insert_mappings = false,
  float_opts = {
    border = 'curved',
    winblend = 0,
    highlights = {
      border = 'Normal',
      background = 'Normal',
    },
  },
})

local Terminal = require('toggleterm.terminal').Terminal
local gitui = Terminal:new({ cmd = 'gitui', hidden = false })

function _GITUI_TOGGLE()
  os.execute('ssh-add ~/.ssh/id_rsa')
  gitui:toggle()
end

local node = Terminal:new({ cmd = 'node', hidden = true })

function _NODE_TOGGLE()
  node:toggle()
end

local htop = Terminal:new({ cmd = 'htop', hidden = true })

function _HTOP_TOGGLE()
  htop:toggle()
end

local cargo_run = Terminal:new({ cmd = 'cargo run', hidden = true })

function _CARGO_RUN()
  cargo_run:toggle()
end

local ranger = Terminal:new({ cmd = 'ranger', hidden = true })

function _RANGER()
  ranger:toggle()
end

local cargo_test = Terminal:new({ cmd = 'cargo test', hidden = true })

function _CARGO_TEST()
  cargo_test:toggle()
end

local browser_sync = Terminal:new({
  cmd = 'browser-sync start --server . --files .',
  hidden = true,
  on_open = function(term)
    vim.api.nvim_buf_set_keymap(term.bufnr, 't', 'q', '<cmd>close<CR>', { noremap = true, silent = true })
  end,
})

function _BROWSER_SYNC()
  browser_sync:toggle()
end
