local g = vim.g;

g.nvim_tree_icons = {
  default = "",
  symlink = "",
  git = {
    unstaged = "",
    staged = "S",
    unmerged = "",
    renamed = "➜",
    deleted = "",
    untracked = "U",
    ignored = "◌",
  },
  folder = {
    default = "",
    open = "",
    empty = "",
    empty_open = "",
    symlink = "",
  },
}

-- g.nvim_tree_respect_buf_cwd = 0
g.nvim_tree_icon_padding = '  '
require'nvim-tree'.setup {
  update_to_buf_dir = {
    enable = false,
  },
  ignore_ft_on_setup = {
    "dashboard",
  },
  update_cwd = false,
  open_on_tab = true,
  system_open = {
    cmd  = "code",
    args = {"."}
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 500,
  },
  view = {
    width = 50,
    mappings = {
      list = {
        { key = "S", action = "system_open" },
        { key = "s", action = "" },
      }
    },
  },
  show_icons = {
    git = 1,
    folders = 1,
    files = 1,
    folder_arrows = 1,
    tree_width = 30,
  },
  filters = {
    custom = {'.DS_Store'}
  },
}
