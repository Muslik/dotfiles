local g = vim.g;

g.nvim_tree_respect_buf_cwd = 1
g.nvim_tree_icon_padding = '  '
g.nvim_tree_quit_on_open = 1
g.nvim_tree_add_trailing = 1
g.nvim_tree_show_icons = {
  git = 1,
  folders = 1,
  files = 1,
  ['folder_arrows'] = 0,
}
g.nvim_tree_icons = {
  default = '',
}
require'nvim-tree'.setup {
  -- update_cwd = true,
  -- update_focused_file = {
  --   enable = true,
  --   update_cwd = true
  -- },
  open_on_tab = true,
  system_open = {
    cmd  = "code",
    args = {"."}
  },
  view = {
    width = 50
  },
  filters = {
    custom = {'.DS_Store'}
  }
}
