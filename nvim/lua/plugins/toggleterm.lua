local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
	return
end

toggleterm.setup{
  -- size can be a number or function which is passed the current terminal
  size = 20,
  open_mapping = [[<leader>tt]],
  direction = 'float',
  insert_mappings = false,
  float_opts = {
    border = 'curved',
    winblend = 0,
    highlights = {
      border = "Normal",
      background = "Normal",
    }
  }
}

local Terminal  = require('toggleterm.terminal').Terminal
Git = Terminal:new({ cmd = "gitui", hidden = true })
Node = Terminal:new({ cmd = "node", hidden = true })
Htop = Terminal:new({ cmd = "htop", hidden = true })
Spotify = Terminal:new({ cmd = "spt", hidden = true })
