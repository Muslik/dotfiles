require("toggleterm").setup{
  -- size can be a number or function which is passed the current terminal
  size = 20,
  open_mapping = [[<leader>tt]],
  direction = 'float',
  insert_mappings = false,
  float_opts = {
    border = 'single',
    highlights = {
      border = "Normal",
      background = "Normal",
    }
  }
}

local Terminal  = require('toggleterm.terminal').Terminal
Git = Terminal:new({ cmd = "gitui", hidden = true })
Spotify = Terminal:new({ cmd = "spt", hidden = true })
