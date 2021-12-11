local cmd = vim.cmd;
local g = vim.g;

g.goyo_width = '70%'
g.goyo_height = '80%'

cmd [[
au! User GoyoLeave :hi Normal guibg=NONE ctermbg=NONE | :hi NonText guibg=NONE ctermbg=NONE
]]
