require("nvim-web-devicons").set_icon {
  org = {
    icon = VimConfig.icons.fileBg,
    color = "#428850",
    cterm_color = "65",
    name = "Org"
  },
  NvimTree = {
    icon = VimConfig.icons.tree,
  },
}

require'nvim-web-devicons'.setup {}
