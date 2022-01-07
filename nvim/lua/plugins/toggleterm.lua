require("toggleterm").setup{
  -- size can be a number or function which is passed the current terminal
  size = 20,
  open_mapping = [[<c-t>]],
  direction = 'float',
  float_opts = {
    border = 'single',
    highlights = {
      border = "Normal",
      background = "Normal",
    }
  }
}

local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

function Lazygit_toggle()
  lazygit:toggle()
end
